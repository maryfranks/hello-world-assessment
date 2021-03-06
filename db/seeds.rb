# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.delete_all
Post.delete_all
Reply.delete_all

ruby = User.create(username: "ruby", password: "1234", password_confirmation: "1234")
jason = User.create(username: "jason", password: "1234", password_confirmation: "1234")

Post.create(user_id: ruby.id, text: "I can call you Betty, and Betty when you call me, you can call me Al", city: "Toronto", lat: "43.8554579", long: "-79.00248100000002", weather: "9")
Post.create(user_id: jason.id, text: "Wake me up before you go go, take me dancing tonight", city: "Montreal", lat: "45.7058381", long: "-73.47426", weather: "3")

ruby_post = Post.create(user_id: ruby.id, text: "I would walk 500 miles", city: "Toronto", lat: "43.8554579", long: "-79.00248100000002", weather: "9")
Reply.create(user_id: jason.id, post_id: ruby_post.id, reply: "and I would walk 500 more")

jason_post = Post.create(user_id: jason.id, text: "We got to install microwave ovens, custom kitchen deliveries", city: "Montreal", lat: "45.7058381", long: "-73.47426", weather: "3")
Reply.create(user_id: ruby.id, post_id: jason_post.id, reply: "We got to move these refrigerators, we gotta move these color TVs")
