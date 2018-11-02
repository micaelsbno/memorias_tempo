require 'rails_helper'

feature 'create user', :type => :feature do
  it 'creates correctly' do
    visit new_user_path

    fill_in 'username', with: 'test_user'
    fill_in 'password', with: '1234'
    click_button 'Submit'

    expect(page).to have_content 'test_user'
  end
end
