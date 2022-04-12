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

ActiveRecord::Schema.define(version: 2022_04_12_024221) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.string "bank_name"
    t.string "account_number"
  end

  create_table "carpool_guests", force: :cascade do |t|
    t.integer "carpool_id"
    t.integer "user_id"
  end

  create_table "carpools", force: :cascade do |t|
    t.date "carpool_date"
    t.time "departure_time"
    t.integer "driver_user_id"
    t.integer "number_of_guests_available"
    t.float "one_way_cost"
    t.integer "origin_location_id"
    t.integer "destination_location_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.string "location_type"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.integer "user_id"
    t.float "inflow_amount"
    t.float "outflow_amount"
    t.integer "carpool_guest_id"
    t.integer "bank_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "address1"
    t.string "address2"
    t.integer "city_id"
    t.string "state"
    t.string "zip"
    t.string "cellphone_number"
    t.integer "home_neighborhood_location_id"
    t.string "has_car"
    t.integer "car_guest_capacity"
  end

end
