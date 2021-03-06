ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...

  def is_logged_in?
    !session[:user_id].nil?
  end
end

class ActionDispatch::IntegrationTest
  def login_as(user, password: 'TheBoyisBad12!')
    post login_path, params: {session:{username_or_email: user.email, password: password}}
  end
end
