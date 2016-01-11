require 'test_helper'

class UnauthenticatedUserUnsuccessfulLoginTest < ActionDispatch::IntegrationTest

  test "unauthenticated user is redirected to login page after entering an invalid password" do
    skip
    user = User.create(email: "chris@example.com", password: "password")
    visit root_path

    assert_equal "/login", current_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "passwor"
    fill_in "Confirmation", with: "passwor"
    click_button "Login"

    assert_equal "/login", current_path
  end

  test "unauthenticated user is redirected to login page after entering an invalid email" do
    skip
    user = User.create(email: "chris@example.com", password: "password")
    visit root_path

    assert_equal "/login", current_path

    fill_in "Email", with: "wrongemail@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Login"

    assert_equal "/login", current_path
  end

  test "unauthenticated user is redirected to login page if confirmation and password don't match" do
    skip
    user = User.create(email: "chris@example.com", password: "password")
    visit root_path

    assert_equal "/login", current_path

    fill_in "Email", with: "wrong.email@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "passwor"
    click_button "Login"

    assert_equal "/login", current_path
  end
end
