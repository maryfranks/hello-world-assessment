require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    # skip
    get posts_url
    assert_response :success
  end

  test "root" do
    # skip
    get root_url
    assert_response :success
  end

  test "can create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { text: "Good times" } }
    end
    assert_equal "Post Created", flash[:notice]
  end

  test "post does not save without text" do
    post posts_url, params: { post: { text: nil } }
    assert_equal "Oops, try again - Posts must have text!", flash[:error]
  end

end
