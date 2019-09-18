require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jim)
  end

  test "timeline should redirect to login unless logged in" do
    get timeline_path
    assert_redirected_to login_path    
  end

  test 'should get timeline if logged in' do
    login_as(@user)
    get timeline_path
    assert :success
  end

  test "should get landing page and redirect to timeline if user is logged in" do
    login_as(@user)
    get root_path
    assert_response :success
  end

end
