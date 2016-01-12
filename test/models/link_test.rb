require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "Must have a valid url for the link" do
    user = User.create(email: "test@example.com", password: "password")
    link = Link.new(user_id: user.id, url: "google.com.com", title: "fake google")

    refute link.valid?
    assert_equal link.errors.full_messages, ["Url is not a valid URL"]
  end

  test "Must have a title for the link" do
    user = User.create(email: "test@example.com", password: "password")
    link = Link.new(user_id: user.id, url: "https://google.com")

    refute link.valid?
    assert_equal link.errors.full_messages, ["Title can't be blank"]
  end
end
