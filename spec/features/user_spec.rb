require 'rails_helper'

feature 'User Accounts', :type => :feature do
  it 'creates new account' do
    visit new_user_path

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
