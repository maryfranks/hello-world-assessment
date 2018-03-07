require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    value(user).must_be :valid?
  end

  test "can create user" do
    skip
    user = User.new(username: "superuser", password: "1234", password_confirmation: "1234")
    assert user.save
  end

  test "user must have username" do
    skip
    user = User.new(password: "1234", password_confirmation: "1234")
    refute user.save
  end

  test "username must be unique" do
    skip
    user1 = User.create(username: "jsmith", password: "1234", password_confirmation: "1234")
    user2 = User.new(username: "jsmith", password: "5678", password_confirmation: "5678")
    refute user.save
  end

  test "user must have password and password confirmation" do
    skip
    user = User.new(username: "awesomeperson", password: "1234")
    refute user.save
  end

end
