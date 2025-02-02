# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_18_090804) do
  create_table "calendar_tags", force: :cascade do |t|
    t.integer "user_calendar_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_calendar_tags_on_tag_id"
    t.index ["user_calendar_id"], name: "index_calendar_tags_on_user_calendar_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "user_calendar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_calendar_id"], name: "index_comments_on_user_calendar_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_calendar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_calendar_id"], name: "index_events_on_user_calendar_id"
  end

  create_table "saved_calendars", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user_calendar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_calendar_id"], name: "index_saved_calendars_on_user_calendar_id"
    t.index ["user_id"], name: "index_saved_calendars_on_user_id"
  end

  create_table "shared_calendars", force: :cascade do |t|
    t.integer "user_calendar_id", null: false
    t.integer "user_id", null: false
    t.boolean "can_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_calendar_id"], name: "index_shared_calendars_on_user_calendar_id"
    t.index ["user_id"], name: "index_shared_calendars_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_calendars", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "shared"
    t.string "share_url"
    t.index ["user_id"], name: "index_user_calendars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "calendar_tags", "tags"
  add_foreign_key "calendar_tags", "user_calendars"
  add_foreign_key "comments", "user_calendars"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "user_calendars"
  add_foreign_key "saved_calendars", "user_calendars"
  add_foreign_key "saved_calendars", "users"
  add_foreign_key "shared_calendars", "user_calendars"
  add_foreign_key "shared_calendars", "users"
  add_foreign_key "user_calendars", "users"
end
