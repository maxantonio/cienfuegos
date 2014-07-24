require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest

  test "sign in an existing user and logout" do
    visit sign_in_path

    fill_in "Email",    with: "tim@apple.com"
    fill_in "Password", with: "foobar"

    click_button "Sign in"

    click_link "Sign out"
  end

  test "sign up a new user" do
    visit sign_up_path

    fill_in "Name",     with: "John Doe"
    fill_in "Email",    with: "john@apple.com"
    fill_in "Password", with: "foobar"

    click_button "Create my account"
  end

end

