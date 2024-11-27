class SavedCalendar < ApplicationRecord
  belongs_to :user
  belongs_to :user_calendar
end
