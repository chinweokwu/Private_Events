require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  scenario 'home page' do
    visit '/signup'
    expect(page).to have_content('Sign up | Private Events')
  end
end
