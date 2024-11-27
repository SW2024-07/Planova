class User < ApplicationRecord
  has_secure_password
  
  has_many :user_calendars
  has_many :comments
  has_many :saved_calendars
  has_many :shared_calendars
  has_many :shared_user_calendars
end
