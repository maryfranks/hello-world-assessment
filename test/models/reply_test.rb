require "test_helper"

describe Reply do

  test "reply must have text" do
    # skip
    reply = Reply.new(user_id: User.first.id, post_id: Post.first.id)
    refute reply.save
  end

  test "reply must have user" do
    # skip
    reply = Reply.new(post_id: Post.first.id, reply: "woohoo")
    refute reply.save
  end

end
