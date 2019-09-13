require 'test_helper'

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator = administrators(:one)
  end

  test "should get index" do
    get administrators_path 
    assert :success
  end

  test "should show administrator" do
    get administrator_path(@administrator)
    assert :success
  end

  test "should get new" do
    get new_administrator_path
    assert :success
  end 

  test "should get edit" do
    get administrator_path(@administrator)
  end

  test "should create an administrator" do
    assert_difference('Administrator.count') do
      post administrators_path, params: { administrator:{ email: 'new@new.com', name: 'New Admin', username: 'NewAdminUser', password: 'ADMINISSTRATOR12!@#' } }
    end

    assert_redirected_to administrator_path(Administrator.last)
  end

  test 'should update administrator' do
    patch administrator_path(@administrator), params: {     
                                                        administrator: { username: @administrator.username, 
                                                                          password: 'Administrator12#', email: 
                                                                          @administrator.email, 
                                                                          name: @administrator.name } }
    assert_redirected_to @administrator
  end

  test 'should delete administrator' do 
    assert_difference('Administrator.count', -1) do
      delete administrator_path(@administrator)
    end

    assert_redirected_to administrators_path
  end


  # setup do
  #   @administrator = administrators(:one)
  # end

  # test "should get index" do
  #   get administrators_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_administrator_url
  #   assert_response :success
  # end

  # test "should create administrator" do
  #   assert_difference('Administrator.count') do
  #     post administrators_url, params: {  administrator: {email: @administrator.email, name: @administrator.name, username: @administrator.username  } }
  #   end

  #   assert_redirected_to administrator_url(Administrator.last)
  # end

  # test "should show administrator" do
  #   get administrator_url(@administrator)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_administrator_url(@administrator)
  #   assert_response :success
  # end

  # test "should update administrator" do
  #   patch administrator_url(@administrator), params: { administrator: {email: @administrator.email, name: @administrator.name, username: @administrator.username  } }
  #   assert_redirected_to administrator_url(@administrator)
  # end

  # test "should destroy administrator" do
  #   assert_difference('Administrator.count') do
  #     delete administrator_url(@administrator)
  #   end

  #   assert_redirected_to administrators_url
  # end
end
