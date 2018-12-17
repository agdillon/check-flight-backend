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

ActiveRecord::Schema.define(version: 2018_12_13_225935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airport_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_airport_users_on_airport_id"
    t.index ["user_id"], name: "index_airport_users_on_user_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.decimal "lat"
    t.decimal "long"
    t.string "name"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avails", force: :cascade do |t|
    t.datetime "date"
    t.boolean "morning"
    t.boolean "afternoon"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "firstName"
    t.string "lastName"
    t.boolean "isExaminer", default: false
    t.text "bio"
    t.integer "rates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "airport_users", "airports"
  add_foreign_key "airport_users", "users"
  add_foreign_key "avails", "users"
end
