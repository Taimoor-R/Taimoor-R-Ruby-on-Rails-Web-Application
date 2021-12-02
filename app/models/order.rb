class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy # has many line items that are dependet destroy
  enum pay_type: { # enum for selection menu in order payment type
    "Check"          => 0,
    "Credit card"    => 1,
    "Bank Transfer" => 2
}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, :address, :email, presence: true # validations for presence of these params
  validates :pay_type, inclusion: pay_types.keys # validation for paytype keys to be present

  def add_line_items_from_cart(cart) # method to add line items from cart to order table, where the cart id of line item is changed to nil so when cart is deleted after checkout linedtems assoicated to cart dont delete
    cart.line_items.each do |item| # changing cart id of line items to nil and then transfering then to order.lineitems
      item.cart_id = nil
      line_items << item
    end
  end
  def total_price # total price to calculate for orders.
    line_items.to_a.sum { |item| item.total_price }
  end
end
