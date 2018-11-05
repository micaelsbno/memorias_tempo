require 'rails_helper'

describe SessionsHelper, :type => :helper do
  
  before { User.create(username: 'test_user', password: '123') }
  let (:user) { User.find_by(username: 'test_user') }
  describe '#logged_in?' do
    it 'returns false if there is no session' do
      session[:user_id] = user.id

      expect(logged_in?).to be true
    end

    it 'returns true if user has session' do
      expect(logged_in?).to be false
    end
  end

  describe '#delete_user_session' do

    # move this to integration tests
    it 'return hash with location' do
      session[:user_id] = user.id

      delete_user_session

      expect(logged_in?).to be false
    end
  end
end
