require "test_helper"

describe Post do

  test "can create post" do
    # skip
    user = User.create(username: "pooh", password: "1234", password_confirmation: "1234")
    post = Post.new
    post.text = "hello"
    post.city = "Vancouver"
    post.user_id = user.id
    assert post.save
  end

  test "post needs text" do
    # skip
    post = Post.new
    post.city = "Vancouver"
    post.save
    refute post.save
  end

  test "post needs user" do
    # skip
    post = Post.new(text: "goodbye", city: "Vancouver")
    refute post.save
  end

  test "post needs city" do
    # skip
    user = User.create(username: "bear", password: "1234", password_confirmation: "1234")
    post = Post.new(text: "woot", user_id: user.id)
    refute post.save
  end

end
