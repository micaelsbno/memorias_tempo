require 'rails_helper'

describe 'homepage view' do  
  context 'user is not logged in:' do
    before { visit root_path }

    it 'shows login form' do
      expect(page).to have_form '/sessions', 'post'
    end
  end

  context 'the user is logged in:' do 
    before { 
      User.create(username: 'test_user', password: '123')
      visit root_path
      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '123'
      click_button 'Login'
    }

    it 'hides login' do
      expect(page).to_not have_form '/sessions', 'post', :with => { name: 'login-form' }
    end

    it 'shows logout' do
      expect(page).to have_form '/sessions', 'post', :with => { name: 'logout-form' }
    end
  end
end
