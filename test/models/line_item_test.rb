require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "No empty Line Item" do
    item = LineItem.new
    item.save
    refute item.valid?
  end
end
