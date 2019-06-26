require 'test_helper'

class AttendedEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attended_events_create_url
    assert_response :success
  end

end
