require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "No empty Product" do
    product = Product.new
    product.save
    refute product.valid?
  end
  test "product must be Unique(NO Duplicates)" do
    product1 = Product.new
    product2 = Product.new

    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.category = "Music"
    product1.save
    assert product1.valid?
    product2.title = "Unique title 1"
    product2.description = "sjdfsdjkghshgs"
    product2.price = 2
    product2.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product2.supply = 1
    product2.category = "Music"
    product2.save
    refute product2.valid?
  end
  test " Save Valid Product" do
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.category = "Music"
    product1.save
    assert product1.valid?
  end
  test "No products Above or Below Price Range" do
    product1 = Product.new
    product2 = Product.new
    product3 = Product.new
    product1.title = "Unique title 12"
    product1.description = "Bfdsugusgisogh"
    product1.price = -1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.category = "Music"
    product1.save
    refute product1.valid?
    product2.title = "Unique title 11"
    product2.description = "sjdfsdjkghshgs"
    product2.price = 1001
    product2.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product2.supply = 1
    product2.category = "Music"
    product2.save
    refute product2.valid?
    product3.title = "Unique title 13"
    product3.description = "sjdfsdjkghshgdghddfgs"
    product3.price = 10
    product3.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product3.supply = 1
    product3.category = "Music"
    product3.save
    assert product3.valid?
  end
  test "Dont save Product with Supply less than 0" do
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = -1
    product1.save
    refute product1.valid?
  end
  test "Dont save Product without Category selection" do
    product1 = Product.new
    product1.title = "Unique title 1"
    product1.description = "Bfdsugusgisogh"
    product1.price = 1
    product1.image_url = "https://commercial.bunn.com/img/image-not-available.png"
    product1.supply = 1
    product1.save
    refute product1.valid?
  end

end
