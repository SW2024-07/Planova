class CreateCalendarTags < ActiveRecord::Migration[7.1]
  def change
    create_table :calendar_tags do |t|
      t.references :user_calendar, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
