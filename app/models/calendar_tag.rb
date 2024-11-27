class CalendarTag < ApplicationRecord
  belongs_to :user_calendar
  belongs_to :tag
end
