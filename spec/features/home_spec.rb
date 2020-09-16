require 'rails_helper'

RSpec.describe 'Home features' do
  it 'displays home & event pages' do
    visit('/home/index')
    expect(page).to have_content('Home#index')
    click_link('Events')
    expect(current_path).to eql('/events')
    expect(page).to have_content('Events')
  end
end
