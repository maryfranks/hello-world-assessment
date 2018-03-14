require "test_helper"

feature "Post" do

  test "new user sees log in and sign up options" do
    visit "posts"
    assert page.has_link? "Log in", href: new_session_path
    assert page.has_link? "Sign Up", href: new_user_path
  end

  test "user can log in" do
    visit "posts"
    within(:xpath, ".//h2[@id='log-in']") do
      click_link "Log in"
    end
    fill_in "username", :with => "imjoe"
    fill_in "password", :with => "1234"
    click_on "Log in"
    assert page.has_field? "post[text]"
  end

  test "user can sign up" do
    # skip
    visit "posts"
    within(:xpath, ".//h2[@id='sign-up']") do
      click_link "Sign Up"
    end
    fill_in "user_username", :with => "newuser"
    fill_in "user_password", :with => "1234"
    fill_in "user_password_confirmation", :with => "1234"
    find_button("Sign Up").click
    assert_equal new_session_path, current_path
  end

  test "submit new post via form" do
    skip
    visit "posts"
    within(:xpath, ".//h2[@id='log-in']") do
      click_link "Log in"
    end
    fill_in "username", :with => "imjoe"
    fill_in "password", :with => "1234"
    click_on "Log in"
    visit "posts"
    fill_in "post[text]", :with => "New Post"
    fill_in "post[city]", :with => "Vancouver"
    click_on "Done"
    assert_equal "/posts", current_path
    assert page.has_content? "New Post"
  end

  test "submit new reply via form" do
    visit "posts"
    within(:xpath, ".//h2[@id='log-in']") do
      click_link "Log in"
    end
    fill_in "username", :with => "imjoe"
    fill_in "password", :with => "1234"
    click_on "Log in"
    visit "posts"
    within(first(:xpath, ".//div[@class='reply-form']")) do
      fill_in "reply", :with => "abracadabra"
      click_on "Reply"
    end
    assert_equal "/posts", current_path
    assert page.has_content? "abracadabra"
  end

end
