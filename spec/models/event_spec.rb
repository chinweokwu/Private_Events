require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:event_attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
  end

  subject { described_class.new(location: 'nil', description: 'nil', date: 'nil') }

  it 'is invalid without a location' do
    subject.location = 'nil'
  end

  it 'is invalid without a description' do
    subject.description = 'nil'
  end

  it 'is invalid without a date' do
    subject.date = 'nil'
  end

  it 'is valid with a location' do
    subject.location = 'Anything'
  end

  it 'is valid with a description' do
    subject.description = 'Anything'
  end

  it 'is valid with a date' do
    subject.date = '10/10/2020'
  end
end
