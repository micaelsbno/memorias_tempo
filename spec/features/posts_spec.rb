require 'rails_helper'

feature 'Create Posts', :type => :request do
  
  before { 
    User.create(username: 'test_user', password: '123')
    visit root_path
    fill_in 'username', with: 'test_user'
    fill_in 'password', with: '123'
    click_button 'Login'
  }
  let (:user) { User.find_by(username: 'test_user') }
  
  it 'user creates a posts with gps' do
    post '/posts', :params => { lat: '-37.8231957', lon: '144.98891799999998' }
    expect(response).to be 'Melbourne'
  end
end
