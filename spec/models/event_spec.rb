require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {
    described_class.new(name: "paul oksana",
                        location: "nigeria ukraine",
                        description: "Lorem ipsum",
                        date: Time.now,
                        user_id: 1)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a location" do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end
end
