class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, :optional => true
  def add_product(product) # method added to add products in lineitems linked to current cart
    current_item = line_items.find_by(product_id: product.id) # current line item set by fineding lineitem from product id
    if current_item
      current_item.quantity += 1 # incement line item quanity if current item exists
      #so in cart if you add 2 of the same product types it says 2 harry potter book hence harry potter book is a product you create a line item of this product by linking product id if the line item exists it justs adds to the item quanity.
    else
      current_item = line_items.build(product_id: product.id) # if current item doesnot exsist make new current item and build it using product id. then next time this product will be added to cart no new line item will be created old line item will be added by quanity + 1
    end
    current_item
  end
  def total_price # caluclates totale price of all items in cart by adding them.
    line_items.to_a.sum { |item| item.total_price }
  end
end
