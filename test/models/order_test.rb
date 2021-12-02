require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test " Dont Save empty order" do # DOESNT SAVE EMPTY ORDER
    order = Order.new
    order.save
    refute order.valid?
  end
  test " Doesnt Save Order without email " do # SAVES VALID ORDER
    order = Order.new
    order.name = 'timmy'
    order.address = 'Bfdsugusgisogh123'
    order.pay_type = 'Bank Transfer'
    order.save
    refute order.valid?
  end
  test " Doesnt Save Order with wrong email format " do # SAVES VALID ORDER
    order = Order.new
    order.name = 'timmy'
    order.address = 'Bfdsugusgisogh123'
    order.email = 'coursework.com'
    order.pay_type = 'Bank Transfer'
    order.save
    refute order.valid?
  end
  test " Doesnt Save Order without correct payment method " do # SAVES VALID ORDER
    order = Order.new
    order.name = 'timmy'
    order.address = 'Bfdsugusgisogh123'
    order.save
    refute order.valid?
  end
  test " Save Valid order" do # SAVES VALID ORDER
    order = Order.new
    order.name = 'timmy'
    order.email = 'course@work.com'
    order.address = 'Bfdsugusgisogh123'
    order.pay_type = 'Bank Transfer'
    order.save
    assert order.valid?
  end
end
