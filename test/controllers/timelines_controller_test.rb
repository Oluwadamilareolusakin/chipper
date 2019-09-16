require 'test_helper'

class TimelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timeline_path
    assert_response :success
  end

end
