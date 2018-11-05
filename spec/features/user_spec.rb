require 'rails_helper'

feature 'User Accounts', :type => :feature do

  before { User.create(username: 'test_user', password: '1234') }

  context 'user input is correct' do
    it 'creates new account' do
      visit '/register'

      fill_in 'username', with: 'new_test_user'
      fill_in 'password', with: '1234'
      click_button 'Submit'

      expect(page).to have_content 'new_test_user'
    end

    it 'logs in' do
      visit root_path

      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '1234'
      click_button 'Login'

      expect(page).to have_content 'test_user'
    end

    it 'logs out' do
      visit root_path
      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '1234'
      click_button 'Login'
      click_button 'Logout'

      expect(page).to have_form '/sessions', 'post'
    end
  end

  context 'user input is invalid' do
    it 'shows an error message if password is blank' do
      visit root_path

      fill_in 'username', with: 'test_user'
      click_button 'Login'

      expect(page).to have_content 'Username or password invalid'
    end

    it 'shows an error message if user doesnt exist' do
      visit root_path

      fill_in 'username', with: 'test_user23'
      fill_in 'password', with: 'pass'
      click_button 'Login'

      expect(page).to have_content 'Username or password invalid'
    end

    it 'shows an error when creating a new account' do
      visit '/register'

      fill_in 'username', with: 'test_user'
      fill_in 'password', with: '123'
      click_button 'Submit'

      expect(page).to have_content 'Username is already taken'
    end
  end
end
