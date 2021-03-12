require "test_helper"

class TwilioControllerTest < ActionDispatch::IntegrationTest
  test "should get sm" do
    get twilio_sm_url
    assert_response :success
  end
end
