class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees,	through: :event_attendees

  scope :future_events, -> { where('date >= ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }

  def future_events
    self.events.future
  end

  def past_events
    self.events.past
  end
end
