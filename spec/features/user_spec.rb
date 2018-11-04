require 'rails_helper'

feature 'User Accounts', :type => :feature do
  context 'user input is correct' do
    it 'creates new account' do
      visit '/register'

      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '1234'
      click_button 'Submit'

      expect(page).to have_content 'test_user'
    end

    it 'logs in' do
      User.create(username: 'test_user', password: '1234')
      visit root_path

      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '1234'
      click_button 'Login'

      expect(page).to have_content 'test_user'
    end
  end

  context 'user input is invalid' do
    it 'shows an error message if password is blank' do
      visit root_path

      fill_in 'username', with: 'test_user'
      click_button 'Login'

      expect(page).to have_content 'Username or password invalid'
    end

    it 'shows an error when creating a new account' do
      User.create(username: 'test_user', password: '123')
      visit '/register'

      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '123'
      click_button 'Submit'

      expect(page).to have_content 'Username is already taken'
    end
  end
end
