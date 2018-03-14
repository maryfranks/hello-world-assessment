require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  include SignInHelper

  setup do
    # skip
    @user = users(:joe)
    sign_in_as users(:joe)
  end

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
    # skip
    assert_difference('Post.count') do
      post posts_url, params: { post: { text: "Good times", city: "Vancouver" } }
    end
    assert_equal "Post Created", flash[:notice]
  end

  test "lat long and weather save" do
    # skip
    post posts_url, params: { post: { text: "I love APIs", city: "Vancouver", lat: "55555", long: "88888", weather: "9" } }
    assert_equal "55555", Post.last.lat
    assert_equal "88888", Post.last.long
    assert_equal "9", Post.last.weather
  end

  test "post does not save without text" do
    # skip
    post posts_url, params: { post: { text: nil, city: "Vancouver" } }
    assert_equal "Oops, try again - Posts must have text and city!", flash[:error]
  end

  test "post does not save without city" do
    # skip
    post posts_url, params: { post: { text: "hi there", city: nil } }
    assert_equal "Oops, try again - Posts must have text and city!", flash[:error]
  end

end
