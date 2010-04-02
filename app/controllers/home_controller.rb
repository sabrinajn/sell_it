class HomeController < ApplicationController
  def index
    @products = Product.find(:all)
  end

def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid product"
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
