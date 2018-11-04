require 'rails_helper'

describe UsersHelper, :type => :helper do

  let(:user) { User.new(username: 'test_user', password: '123') }
  before { user.save }

  describe 'valid_user?' do
    it 'returns true if the user is found' do
      expect(valid_user?(user.id)).to be true
    end
  end
end
