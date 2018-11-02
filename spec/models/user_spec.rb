require 'rails_helper'

FactoryBot.define do
  factory :user do
    username { 'Name' }
    password { 'test@user.com' }
  end
end

describe User do 

  it 'has a valid factory' do
    expect(build(:user).save).to be true
  end

  it 'is invalid without a unique name' do
    user = create(:user)
    second_user = build(:user, username: 'Name', password: '123')

    expect(second_user.save).to be false
  end

  it 'is invalid without a password' do
    user = build(:user, username: 'Name', password: nil)

    expect(user.save).to be false
  end
end
