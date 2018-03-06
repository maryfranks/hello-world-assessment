require "test_helper"

feature "Post" do
  # scenario "the test is sound" do
  #   visit root_path
  #   page.must_have_content "Hello World"
  #   page.wont_have_content "Goodbye All!"
  # end
  test "post submission form exists" do
    skip
    visit "posts"
    assert page.has_field? "text", type: "text"
  end

  test "submit new post via form" do
    skip
    visit "posts"
    fill_in "text", :with => "Hello World"
    click_on "Submit"
    # page should reload when form is submitted
    assert_equal "/pages", current_path
    assert_selector "p", text: "Hello World"
    assert_equal "Post Created", flash[:notice]
  end

  test "displays flash when post with no text does not save" do
    skip
    visit "posts"
    click_on "Submit"
    assert_equal "/pages", current_path
    assert_equal "Oops, try again - Posts must have text!", flash[:error]
  end

end
