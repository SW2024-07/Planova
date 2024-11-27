class Tag < ApplicationRecord
  has_many :calendar_tags
  has_many :user_calendars
end
