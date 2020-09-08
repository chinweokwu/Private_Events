require 'rails_helper'

RSpec.describe 'the signin process', type: :feature, js: true do
  feature 'create a user' do
    before(:each) do
      visit new_user_path
      fill_in 'Name', with: 'Oksana'
      fill_in 'Username', with: 'oksana'
      fill_in 'Email', with: 'oksana@mail'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end

    scenario 'create an event --> valid inputs' do
      fill_in 'Name', with: 'Presentation'
      fill_in 'Location', with: 'Kharkiv'
      fill_in 'Description', with: 'E-commerce'
      fill_in 'Date', with: '2020/09/27'
      click_button 'Create Event'
      visit root_path
      expect(page).to have_content('Presentation')
      expect(page).to have_content('E-commerce')
    end

    scenario 'create an event --> invalid inputs' do
      fill_in 'Name', with: ''
      fill_in 'Location', with: ''
      fill_in 'Description', with: ''
      click_button 'Create Event'
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("can't be blank")
    end
  end
end
