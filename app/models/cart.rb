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

  def total
    @cart_items.sum { |item| item.price }
  end


end
