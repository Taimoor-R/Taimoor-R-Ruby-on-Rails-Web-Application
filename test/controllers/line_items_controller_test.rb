require 'test_helper'
class LineItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @line_item = line_items(:one)
    user = User.create!(email: "example@mail.com",
     password: "password", password_confirmation: "password")
     sign_in user
  end
  
  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end

  end

  test "should update line_item" do

    patch line_item_url(@line_item),
    params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end


end
