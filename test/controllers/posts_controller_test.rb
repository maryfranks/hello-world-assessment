require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    # skip
    get posts_url
    assert_response :success
  end

  test "root" do
    skip
    get root_url
    assert_response :success
  end

end
