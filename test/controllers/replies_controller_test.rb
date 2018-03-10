require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  describe RepliesController do

    include SignInHelper

    setup do
      @user = users(:joe)
      sign_in_as users(:joe)
      @joes_post = posts(:hello)
      @sues_post = posts(:dogs)
    end

    test "can reply to own post" do
      skip
      assert_difference('Reply.count') do
        post post_replies_url(@joes_post.id), params: { reply: { reply: "I like your post" } }
      end
      assert_equal "reply posted", flash[:notice]
    end

    test "can reply to other post" do
      skip
      assert_difference('Reply.count') do
        post post_replies_url(@sues_post.id), params: { reply: { reply: "I like your post" } }
      end
      assert_equal "reply posted", flash[:notice]
    end

    test "post save fail" do
      skip
      assert_no_difference('Reply.count') do
        post post_replies_url(@joes_post.id), params: { reply: { reply: nil } }
      end
      assert_equal "reply must have text", flash[:error]
    end

  end

end
