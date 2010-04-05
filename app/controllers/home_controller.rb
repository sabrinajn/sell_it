class HomeController < ApplicationController
  layout 'home'

  def index
    @products = Product.find(:all)
    @product_types = ProductType.find(:all)
    @cart = find_cart

  end

  def show
    @product_type = ProductType.find(params[:id])
    @product_types = ProductType.find(:all)
    @cart = find_cart

  end


  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
    id = rand 10000
    @order = PagSeguro::Order.new(id)

    @cart.cart_items.each do |product|
      product.quantity.times do @order.add :id => product.id, :price => product.price, :description => product.title end
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid product"
    redirect_to :action => 'index'
  end

  def show_cart
    @cart = find_cart

    id = rand 10000
    @order = PagSeguro::Order.new(id)

    @cart.cart_items.each do |product|
      product.quantity.times do @order.add :id => product.id, :price => product.price, :description => product.title end
    end
  end


  def success
    session[:cart] = nil
    flash[:notice] = "Thanks for your order! We are waiting confirmation of payment!"
    redirect_to :action => 'index'
  end


  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Your cart is currently empty"
    redirect_to :action => 'index'
  end


private
  def find_cart
    #cria um novo carrinho, caso naum exista nenhum
    session[:cart] ||= Cart.new
  end

end

