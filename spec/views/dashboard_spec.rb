# frozen_string_literal: true

require "rails_helper"

describe "dashboard view" do
  before {
    User.create(username: "test_user", password: "123")
    visit root_path
    fill_in "username", with: "test_user"
    fill_in "password", with: "123"
    click_button "Login"
  }

  it "shows login form" do
    expect(page).to have_form "/posts", "post"
  end
end
