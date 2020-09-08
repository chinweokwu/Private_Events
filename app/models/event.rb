class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees,	through: :event_attendees

  scope :future_events, -> { where('date >= ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
<<<<<<< HEAD
=======
  validates :date, presence: true
  validate :date_not_allowed
  
  private
	
	def date_not_allowed
		if date.present? && date < Date.today
			errors.add(:date, "can not be in the past.")
		end		
	end	

>>>>>>> f38b595466853c89b702debe03ce744a87acda5b
end
