class SharedCalendar < ApplicationRecord
  belongs_to :user_calendar
  belongs_to :user
end
