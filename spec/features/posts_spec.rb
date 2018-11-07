# frozen_string_literal: true

require "rails_helper"

feature "Visit Another user", type: :feature do
  let (:user) { User.new(username: "test_user", password: "1234") }
  before {
    user.save
    10.times { Post.create(content: "post_content", user_id: user.id) }
  }

  it "shows user posts when visiting url" do
    visit "/users/#{user.username}"

    expect(page).to have_content "post_content"
  end
end
