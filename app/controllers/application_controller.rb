class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception

  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart # a method in your application that retrieves and organizes the contents of the user's shopping cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart
  # Product.where(id: cart.keys): This part queries the Product model in your database to retrieve products that match the IDs stored in the user's shopping cart 
  # .map { |product| { product: product, quantity: cart[product.id.to_s] } }: After retrieving the products from the database, this part maps each product to a hash with two key-value pairs:
  #  ^^^^ :product: This key is associated with the product object from the database.
  #  ^^^^ :quantity: This key is associated with the quantity of that product stored in the user's cart
  # The result is an array of hashes, where each hash represents an item in the user's shopping cart, including the product and its quantity.

  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
