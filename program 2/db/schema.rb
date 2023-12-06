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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_195533) do
  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.string "phone"
    t.string "address"
    t.string "creditnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creditnumber"], name: "index_admins_on_creditnumber", unique: true
    t.index ["phone"], name: "index_admins_on_phone", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "address"
    t.string "creditnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creditnumber"], name: "index_passengers_on_creditnumber", unique: true
    t.index ["email"], name: "index_passengers_on_email", unique: true
    t.index ["phone"], name: "index_passengers_on_phone", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string "passengerid"
    t.string "trainid"
    t.integer "rating"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passengerid"], name: "index_reviews_on_passengerid"
    t.index ["trainid"], name: "index_reviews_on_trainid"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "passengerid"
    t.string "trainid"
    t.integer "confirmationnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passengerid"], name: "index_tickets_on_passengerid"
    t.index ["trainid"], name: "index_tickets_on_trainid"
  end

  create_table "trains", force: :cascade do |t|
    t.string "trainnumber"
    t.string "departurestation"
    t.string "terminationstation"
    t.datetime "departuredate"
    t.datetime "departuretime"
    t.datetime "arrivaldate"
    t.datetime "arrivaltime"
    t.decimal "ticketprice"
    t.integer "traincapacity"
    t.integer "seatsleft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainnumber"], name: "index_trains_on_trainnumber", unique: true
  end

end
