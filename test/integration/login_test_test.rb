require 'test_helper'

class LoginTestTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jim)
  end

  test 'should login with valid details' do
    post login_path, params: {session:{ username_or_email: @user.email, password: 'TheBoyisBad12!' }}
    assert_redirected_to timeline_path

    follow_redirect!
    assert_template 'static_pages/timeline'
    assert is_logged_in?
  end
end
