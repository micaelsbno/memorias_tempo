require 'rails_helper'

FactoryBot.define do
  factory :post do
    content { 'Post content' }
    user_id { 1 }
  end
end

describe Post do 
  
  let (:user) { User.create(username: 'Name', password: '123') }

  it 'has a valid factory' do
    post = build(:post, { content: 'Post content', user_id: user.id })

    expect(post.save).to be true
  end

  it 'is invalid without any content' do
    post = build(:post, { content: '', user_id: user.id })

    expect(post.save).to be false
  end

  it 'is invalid without an user_id' do
    post = build(:post, { content: 'Post content', user_id: nil })

    expect(post.save).to eq false
  end
end