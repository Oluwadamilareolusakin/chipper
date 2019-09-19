require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users( :jim )
  end

  test 'should get index' do
    get users_path
    assert :success
  end

  test 'should show user' do
    get user_path(@user)
    assert :success
  end 

  test 'should get new' do
    get new_user_path
    assert :success
  end

  test 'should create new user' do 
    assert_difference('User.count') do 
      post users_path, params: { user: { username: 'String256',
                                          name: 'String',
                                          email: 'String@string.com',  
                                          gender: 'Male',
                                          nationality: 'Nigerian',
                                          age: '42', password: 'Dammiiee12!' }}
    end

    assert_redirected_to user_path(User.last)
  end

  test 'should get edit' do 
    get edit_user_path(@user)
    assert :success 
  end

  test 'should update user' do
    put user_path(@user), params: { user: { username: @user.username, 
                                              name: 'Bobo', 
                                              email: @user.email,
                                              gender: @user.gender,
                                              nationality: @user.nationality,
                                              age: @user.age,
                                              password: 'Dammiiee12!'} }
    assert_redirected_to @user
  end

  test 'should destroy user' do
    delete user_path(@user)
    assert_redirected_to root_path
  end
end
