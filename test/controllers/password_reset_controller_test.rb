require 'test_helper'

class PasswordResetControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reset_path
    assert_response :success
  end

  test "should get edit" do
    get new_password_path
    assert_response :success
  end

end
