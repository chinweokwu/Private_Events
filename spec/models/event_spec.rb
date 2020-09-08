require 'rails_helper'
require 'capybara/rails'

RSpec.describe Event, type: :model do
  scenario 'create an event --> valid inputs' do
    fill_in 'Name', with: 'Birthday'
    fill_in 'Description', with: 'Party'
    click_button 'Create'
    visit root_path
    expect(page).to have_content('Birthday')
    expect(page).to have_content('Party')
  end

  scenario 'create an event --> invalid inputs' do
    fill_in 'Name', with: ''
    fill_in 'Location',	with: ''
    fill_in 'Description', with: ''
    click_button 'Create'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'edit an event --> valid inputs' do
    event = Event.create!(name: 'Birthday', description: 'Party', creator_id: 1)
    visit edit_event_path(id: event.id)
    fill_in 'Name', with: 'Holiday'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Holiday')
    expect(page).to have_content('Party')
  end

  scenario 'delete an event' do
    fill_in 'Name', with: 'Birthday'
    fill_in 'Description', with: 'Party'
    click_on 'Create'
    visit root_path
    expect(page).to have_content('Birthday')
    expect(page).to have_content('Party')
    expect { click_on('Delete') }.to change(Event, :count).by(-1)
  end

  scenario 'show an event' do
    fill_in 'Name', with: 'Meeting'
    fill_in 'Description', with: 'E-commerse'
    click_button 'Create'
    visit root_path
    click_on('Show')
    expect(page).to have_content('Meeting')
    expect(page).to have_content('E-commerse')
  end
end
