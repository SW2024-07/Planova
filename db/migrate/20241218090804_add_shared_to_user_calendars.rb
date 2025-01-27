class AddSharedToUserCalendars < ActiveRecord::Migration[7.1]
  def change
    add_column :user_calendars, :shared, :boolean
    add_column :user_calendars, :share_url, :string
  end
end
