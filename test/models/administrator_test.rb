require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase
  def setup
    @administrator = Administrator.new(name: 'Tolulope Olusakin', username: 'Tolu the man', email: 'tolu@tolu.com', password: 'administrator')
  end

  test 'administrator must be valid' do
    assert @user.valid?
  end

  test 'administrator must have a name' do
    admin_duplicate = @administrator.dup
    admin_duplicate.name = ''
    assert_not admin_duplicate.valid?
  end

  test 'administrator must have an email' do
    admin_duplicate = @administrator.dup
    admin_duplicate.email = ''
    assert_not admin_duplicate.valid?
  end

  test 'administrator must have a username' do
    admin_duplicate = @administrator.dup
    admin_duplicate.username = ''
    assert_not admin_duplicate.valid?
  end

  test "administrator's username must be less than 15 characters" do
    admin_duplicate = @administrator.dup
    admin_duplicate.email = 'a' * 16
    assert_not admin_duplicate.valid?
  end

  test 'administrator must have a password' do
    admin_duplicate = @administrator.dup
    admin_duplicate.password = ''
    assert_not admin_duplicate.valid?
  end

  test "administrator's email must be valid" do
    admin_duplicate = @admin.dup
    invalid_emails = %w[ example@example example.com example_example+2.com example@ example.example.example ]
    invalid_emails.collect do |email|
      admin_duplicate.email = email
      assert_not admin_duplicate.valid?
    end
  end
end
