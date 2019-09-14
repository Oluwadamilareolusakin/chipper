require 'test_helper'

class PageTitleTestTest < ActionDispatch::IntegrationTest

  setup do
    @base_title = 'Chipper | Social network for the dauntless'
  end

  test 'root title should be Chipper' do
    get root_path
    assert_select 'title', @base_title
  end

  test 'login page title' do
    get login_path
    assert_select 'title', "Log in | #{@base_title}"
  end
end
