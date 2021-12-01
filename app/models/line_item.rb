class LineItem < ApplicationRecord
  belongs_to :order, optional: true # belongs to order
  belongs_to :product, optional: true # belongs to product
  belongs_to :cart # belongs to cart

  def total_price # total price of line items so if we have 2 harry potter books total price would be quantity of line item * single line item price
    product.price * quantity
  end
end
