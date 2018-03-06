require "test_helper"

describe Post do
  let(:post) { Post.new }

  it "must be valid" do
    value(post).must_be :valid?
  end

  test "can create post" do
    # skip
    post = Post.new
    post.text = "hello"
    assert post.save
  end

  test "post needs text" do
    # skip
    post = Post.new
    post.save
    refute post.save
  end

end