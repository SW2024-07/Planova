class UserCalendar < ApplicationRecord
  belongs_to :user
  
  has_many :events
  has_many :comments
  has_many :saved_calendars
  has_many :shared_calendars
  has_many :tags
end
