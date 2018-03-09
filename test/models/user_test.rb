require "test_helper"

describe User do


  test "can create user" do
    # skip
    user = User.new(username: "superuser", password: "1234", password_confirmation: "1234")
    assert user.save
  end

  test "user must have username" do
    # skip
    user = User.new(password: "1234", password_confirmation: "1234")
    refute user.save
  end

  test "username must be unique" do
    # skip
    user1 = User.create(username: "jsmith", password: "1234", password_confirmation: "1234")
    user2 = User.new(username: "jsmith", password: "5678", password_confirmation: "5678")
    refute user2.save
  end


end
