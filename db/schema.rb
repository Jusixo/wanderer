# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170531185614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_name"
    t.string "web_link"
    t.string "event_info"
    t.bigint "admin_id"
    t.text "image_data"
    t.index ["admin_id"], name: "index_events_on_admin_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "user"
    t.string "photo"
    t.bigint "user_id"
    t.bigint "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_favorites_on_photo_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "files", force: :cascade do |t|
    t.binary "content"
    t.text "metadata"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.string "web_link"
    t.string "market_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_photos_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "provider"
    t.string "uid"
    t.string "access_token"
  end

  add_foreign_key "events", "admins"
  add_foreign_key "favorites", "photos"
  add_foreign_key "favorites", "users"
  add_foreign_key "photos", "events"
end
