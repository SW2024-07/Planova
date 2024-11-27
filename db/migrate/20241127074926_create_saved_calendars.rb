class CreateSavedCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_calendars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
