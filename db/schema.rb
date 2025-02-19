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

ActiveRecord::Schema[7.2].define(version: 2025_02_07_112602) do
  create_table "clients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", charset: "utf8mb4", force: :cascade do |t|
    t.string "amount"
    t.bigint "trip_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_expenses_on_client_id"
    t.index ["driver_id"], name: "index_expenses_on_driver_id"
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
  end

  create_table "trips", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "vehicle_id", null: false
    t.string "starting"
    t.string "end"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_trips_on_client_id"
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["vehicle_id"], name: "index_trips_on_vehicle_id"
  end

  create_table "vehicles", charset: "utf8mb4", force: :cascade do |t|
    t.string "number"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "clients"
  add_foreign_key "expenses", "drivers"
  add_foreign_key "expenses", "trips"
  add_foreign_key "trips", "clients"
  add_foreign_key "trips", "drivers"
  add_foreign_key "trips", "vehicles"
end
