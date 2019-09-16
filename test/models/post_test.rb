require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:jim)
    @post = @user.posts.build(body: 'this is a post')
  end 

  test 'post must be valid' do
    assert @post.valid?
  end

  test 'post must have a body' do
    @post.body = ''
    assert_not @post.valid?
  end

  test 'post must belong to a user' do
    @post.user = nil
    assert_not @post.valid?
  end
end
