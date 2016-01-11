require 'test_helper'

class UnauthenticatedUserLogsInTest < ActionDispatch::IntegrationTest

  test "unauthenticated user is redirected to login page and logs in" do
    skip
    user = User.create(email: "chris@example.com", password: "password")
    visit '/'

    assert_equal "/login", current_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Login"

    assert_equal links_path, current_path
  end
end
