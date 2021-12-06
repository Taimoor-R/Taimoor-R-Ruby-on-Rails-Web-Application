require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = User.new
    @user.email = 'test@gmail.com'
    @user.first_name = 'test'
    @user.last_name = 'test2'
    @user.password = '1234abcd'
    assert @user.valid?
    assert @user.save

    @cart = Cart.new
    @cart.user = @user
    assert @cart.save
  end

  test "should get new" do
    assert sign_in @user
    get get ('/carts/' + @cart.id.to_s)
    assert_response :success
    sign_out @user
  end

  test "should show cart" do
    assert sign_in @user
    get ('/carts/' + @cart.id.to_s)
    assert_response :success
    sign_out @user
  end

  test "should get edit" do
    assert sign_in @user
    get edit_cart_url(@cart)
    assert_response :success
    sign_out @user
  end

  test "should update cart" do
    assert sign_in @user
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
    sign_out @user
  end

  test "should destroy cart" do
    assert sign_in @user
    post line_items_url, params: { product_id: products(:ruby).id }
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to homepage_index_url
    sign_out @user
  end
end


test "should create cart" do
  @user1 = User.new
  @user1.email = 'test1@gmail.com'
  @user1.first_name = 'test'
  @user1.last_name = 'test2'
  @user1.password = '1234abcd'
  assert @user1.valid?
  assert @user1.save
  sign_in @user1
  assert_difference('Cart.count') do
    post carts_url, params: {user_id: @user1.id}
  end

  assert_redirected_to cart_url(Cart.last)
  sign_out @user1
end
