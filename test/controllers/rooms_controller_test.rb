require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get rooms_home_url
    assert_response :success
  end
end
