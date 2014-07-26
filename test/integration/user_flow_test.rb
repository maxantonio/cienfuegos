require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

  test "when users can create a post and others can't see it" do
    visit sign_in_path

    fill_in "Email", with: "tim@apple.com"
    fill_in "Password", with: "foobar"

    click_button "Sign in"

    click_link "New Post"

    fill_in "Title", with: "Apple announcement"
    fill_in "Body", with: "Our company is way ahead of the competition
                           in terms of customer satisfaction."

    click_button "Update Post"

    visit posts_path

    assert page.has_content?('Apple announcement'), 'The Apple announcement does not appears.'

    # Log in as another user and check if the post is visible

    click_link 'Sign out'

    visit sign_in_path
    fill_in "Email", with: "john@apple.com"
    fill_in "Password", with: "foobar"
    click_button 'Sign in'

    assert_not page.has_content?('Apple announcement'), 'The Apple announcement belongs to another user.'
  end

  test "when users can't trick the url to hack access" do
    # Make papers fixture belongs to john
    paper = posts(:paper)
    paper.user_id = users(:john).id
    paper.save

    visit sign_in_path
    fill_in "Email", with: "tim@apple.com"
    fill_in "Password", with: "foobar"
    click_button "Sign in"

    visit "/posts/#{paper.id}/edit"

    assert_not page.has_content?('Swift 101'), 'The Swift 101 announcement belongs to another user'
  end

end

