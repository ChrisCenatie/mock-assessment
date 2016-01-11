require 'test_helper'

class UserSignsOutTest < ActionDispatch::IntegrationTest

  test "User can sign out from index page" do
    skip
    user = User.create(email: "chris@example.com", password: "password")
    visit '/'

    assert_equal "/login", current_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal links_path, current_path

    click_link "Sign Out"

    assert_equal login_path, current_path
  end
end
