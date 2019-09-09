require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users( :one )
  end

  test 'should get index' do
    get users_path
    assert :success
  end
end
