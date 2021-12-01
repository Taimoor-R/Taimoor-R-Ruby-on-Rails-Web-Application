require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'cart belong to users' do
    user = User.new
    user.email = 'test@gmail.com'
    user.first_name = 'test'
    user.last_name = 'test2'
    user.password = '1234abcd'
    assert user.valid?
    assert user.save

    cart = Cart.new
    cart.user = user
    assert_equal(user, cart.user)
  end

  test 'can save empty cart' do
    cart = Cart.new
    assert cart.save
  end


end
