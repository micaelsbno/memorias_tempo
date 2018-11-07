# frozen_string_literal: true

require "rails_helper"

FactoryBot.define do
  factory :weather do
    post_id { 1 }
    city { "Melbourne" }
    country { "Australia" }
    lat { -37.8132 }
    lon { 144.963 }
    brief { "Clear" }
    description { "clear sky" }
  end
end

describe Weather do
  let (:user) { User.create(username: "Name", password: "123") }
  let (:post) { Post.create(content: "Post content", user_id: user.id) }

  it "has a valid factory" do
    expect(build(:weather, post_id: post.id).save).to be true
  end

  it "is invalid without a city" do
    expect(build(:weather, city: "").save).to be false
  end

  it "is invalid without a post id" do
    expect(build(:weather, post_id: nil).save).to be false
  end
end
