# frozen_string_literal: true

require "rails_helper"

describe "login" do
  context "user is not logged in:" do
    before { visit "/sessions" }

    it "shows login form" do
      expect(page).to have_form "/sessions", "post"
    end
  end
end
