require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  describe UsersController do

    include SignInHelper

    test "should get new" do
      # skip
      get new_user_url
      assert_response :success
    end

    test "should get show when user is signed in" do
      # skip
      user = users(:joe)
      sign_in_as users(:joe)
      get user_url(user)
      assert_response :success
    end

    test "should create user" do
      # skip
      assert_difference('User.count') do
        post user_url, params: { user: { username: "person", password: "1234", password_confirmation: "1234" } }
      end
      assert_redirected_to user_path
      assert_equal 'Account successfully created!', flash[:notice]

    end

    test "user save fail" do
      # skip
      post user_url, params: { user: { username: nil } }
      assert_equal 'Sorry, try again!', flash[:error]
    end

  end

end
