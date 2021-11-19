require 'test_helper'

class CollectablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collectables_index_url
    assert_response :success
  end

end
