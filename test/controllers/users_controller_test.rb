require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users( :one )
  end

  test 'should get index' do
    get users_path
    assert :success
  end

  test 'should show user' do
    get user_path(@user)
    assert :success
  end 
end
