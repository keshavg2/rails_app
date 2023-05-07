require "test_helper"

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get unauthorized" do
    get error_unauthorized_url
    assert_response :success
  end
end
