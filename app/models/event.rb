class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees,	through: :event_attendees

  scope :future_events, -> { where('date >= ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validate :date_not_allowed

  private

  def date_not_allowed
    errors.add(:date, 'can not be in the past.') if date.present? && date < Date.today
  end
end
