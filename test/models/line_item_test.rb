require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "No empty Line Item" do #NO EMPTY LINE ITEM STORED TEST
    item = LineItem.new
    item.save
    refute item.valid?
  end
  test "Save Product to Line Item without cart" do #NO EMPTY LINE ITEM STORED TEST
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.save
    assert product1.valid?
    product1.save
    @line_item = LineItem.new
    @line_item = product1
    @line_item.save
    assert @line_item.valid?
  end
  test "Dont Save Product to Line Item with invalid product" do #NO EMPTY LINE ITEM STORED TEST
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 0
    product1.save
    refute product1.valid?
    product1.save
    @line_item = LineItem.new
    @line_item = product1
    @line_item.save
    refute @line_item.valid?
  end
  test "Valid via cart Line Item save" do #NO EMPTY LINE ITEM STORED TEST
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.save
    assert product1.valid?
    product1.save
    @cart = Cart.new
    assert @cart.save
    @line_item = LineItem.new
    @line_item = @cart.add_product(product1)
    @line_item.save
    assert @line_item.valid?
  end
end
