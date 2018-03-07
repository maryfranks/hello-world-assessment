require "test_helper"

feature "Post" do
  # scenario "the test is sound" do
  #   visit root_path
  #   page.must_have_content "Hello World"
  #   page.wont_have_content "Goodbye All!"
  # end
  test "post submission form exists" do
    # skip
    visit "posts"
    assert page.has_field? "post[text]"
  end

  test "submit new post via form" do
    # skip
    visit "posts"
    fill_in "post[text]", :with => "New Post"
    click_on "Done"
    assert_equal "/posts", current_path
    assert page.has_text? "New Post"
  end

end
