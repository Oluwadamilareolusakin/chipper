require 'test_helper'

class LoginTestTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jim)
  end

  test 'should login with valid details' do
    post login_path, params: {session:{ email: @user.email, password: 'TheBoyisBad12!' }}
    assert_redirected_to @user

    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
