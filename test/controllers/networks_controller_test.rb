require "test_helper"

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get networks_index_url
    assert_response :success
  end
end
