class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user_calendar
end
