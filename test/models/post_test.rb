require "test_helper"

describe Post do
  # let(:post) { Post.new }

  test "can create post" do
    # skip
    user = User.create(username: "pooh", password: "1234", password_confirmation: "1234")
    post = Post.new
    post.text = "hello"
    post.user_id = user.id
    assert post.save
  end

  test "post needs text" do
    # skip
    post = Post.new
    post.save
    refute post.save
  end

  test "post needs user" do
    # skip
    post = Post.new(text: "goodbye")
    refute post.save
  end

end
