require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:two)
    @user.password = 'Dammiiee12!'
  end

  test "user must be valid" do
    assert @user.valid?
  end

  test "user must have a name" do
    user_duplicate = @user.dup
    user_duplicate.name = ' '
    assert_not user_duplicate.valid?
  end

  test "user must have an email" do
    user_duplicate = @user.dup
    user_duplicate.email = ' '
    assert_not user_duplicate.valid?
  end

  test "user must have a username" do
    user_duplicate = @user.dup
    user_duplicate.username = ' '
    assert_not user_duplicate.valid?
  end

  test "username must be less than 15 characters" do
    user_duplicate = @user.dup
    user_duplicate.username = 'a' * 16
    assert_not user_duplicate.valid?
  end

  test "user must have an age" do
    user_duplicate = @user.dup
    user_duplicate.age = ' '
    assert_not user_duplicate.valid?
  end

  test "user must have a gender" do
    user_duplicate = @user.dup
    user_duplicate.gender = ' '
    assert_not user_duplicate.valid?
  end

  test "user must have a nationality" do
    user_duplicate = @user.dup
    user_duplicate.nationality = ' '
    assert_not user_duplicate.valid?
  end

  test 'authenticated? should return false for user with nil remember_digest' do
    assert_not @user.authenticated?(' ')
  end
end
