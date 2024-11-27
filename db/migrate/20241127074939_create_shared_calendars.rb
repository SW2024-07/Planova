class CreateSharedCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_calendars do |t|
      t.references :user_calendar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :can_edit

      t.timestamps
    end
  end
end
