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

ActiveRecord::Schema.define(version: 2022_04_18_165208) do

  create_table "campgrounds", force: :cascade do |t|
    t.string "camp_name"
    t.boolean "is_full"
  end

  create_table "campsites", force: :cascade do |t|
    t.integer "site_number"
    t.boolean "has_picnic_table"
    t.boolean "has_firepit"
    t.boolean "has_bathrooms"
    t.boolean "has_rv_hookup"
    t.integer "daily_price"
    t.integer "campground_id"
    t.index ["campground_id"], name: "index_campsites_on_campground_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campsite_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["campsite_id"], name: "index_reservations_on_campsite_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "campsites", "campgrounds"
  add_foreign_key "reservations", "campsites"
  add_foreign_key "reservations", "users"
end
