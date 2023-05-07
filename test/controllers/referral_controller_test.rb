require "test_helper"

class ReferralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get referral_index_url
    assert_response :success
  end
end
