require 'test_helper'

class UserCreatesLinkTest < ActionDispatch::IntegrationTest

  test "User successfully adds link" do
    assert Link.count == 0
    visit '/users/new'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Create Account"
    fill_in "Url", with: "https://google.com"
    fill_in "Title", with: "My Search Page"
    click_button "Create Link"

    assert_equal links_path, current_path
    within("#link1") do
       assert page.has_content?("https://google.com")
       assert page.has_content?("My Search Page")
    end
    assert Link.count == 1
    assert_equal Link.last.url, "https://google.com"
    assert_equal Link.last.title, "My Search Page"
    assert_equal Link.last.read_status, "Unread"
  end

  test "User unsuccessfully adds link" do
    assert Link.count == 0
    visit '/users/new'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Create Account"
    click_button "Create Link"

    assert_equal links_path, current_path
    assert page.has_content?("Url is not a valid URL")
    assert page.has_content?("Title can't be blank")
    assert Link.count == 0
  end
end
