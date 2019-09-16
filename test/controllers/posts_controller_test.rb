require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jim)
    @post = @user.posts.build(body: 'This is a post')
    @post.save
  end

  test 'should get show' do
    get post_path(@post)
    assert :success
  end

  test 'should get new' do
    get chip_path
    assert :success
  end

  test 'should create post' do
    post chip_path, params: { post: {body: 'This is a post', user_id: @user.id  }}
    assert_redirected_to timeline_path
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete unchip_path(@post)
    end

    assert_redirected_to timeline_path
  end
end
