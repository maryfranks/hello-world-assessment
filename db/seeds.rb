# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Post.delete_all

ruby_posts = ["red", "green", "blue", "purple", "yellow"]
jason_posts = ["snake", "frog", "cat", "bird"]

ruby = User.create(username: "ruby", password: "1234", password_confirmation: "1234")
jason = User.create(username: "jason", password: "1234", password_confirmation: "1234")

ruby_posts.each do |post|
  post = Post.create(user_id: ruby.id, text: post)
end

jason_posts.each do |post|
  post = Post.create(user_id: jason.id, text: post)
end
