class Cart
  attr_reader :cart_items

  def initialize
    @cart_items = []
  end

  def add_product(product)
    current_item = @cart_items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      @cart_items << CartItem.new(product)
    end
  end

  def total_price
    @cart_items.sum { |item| item.total }
  end


  def quantity
    @cart_items.sum { |item| item.quantity }
  end

end

