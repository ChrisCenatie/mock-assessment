require 'test_helper'

class UserSignsUpTest < ActionDispatch::IntegrationTest

  test "User successfully signs up" do
    visit '/users/new'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert_equal links_path, current_path
  end

  test "User email is already taken" do
    user = User.create(email: "test@example.com", password: "password")
    visit '/users/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert_equal '/users', current_path
    assert page.has_content?("Email has already been taken")
  end

  test "User doesn't enter a password" do
    visit '/users/new'

    fill_in "Email", with: "test@example.com"
    click_button "Create Account"

    assert_equal '/users', current_path
    assert page.has_content?("Password can't be blank")
  end
end
