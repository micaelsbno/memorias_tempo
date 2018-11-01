require 'rails_helper'

RSpec.describe User, type: :model do
  context 'new user' do
    it 'creates a new user correctly' do
      user = described_class.new
      user.username = 'test'
      user.password = '123'
      
      user.save!

      expect("id: #{User.last.id}").to eq("id: #{user.id}")
    end

    it 'throws an error if password is empty' do
      user = described_class.new
      user.username = 'test'
      user.password = ''

      expect(user.save).to eql(false)
    end
  end
end
