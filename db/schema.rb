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

ActiveRecord::Schema.define(version: 2021_03_09_153919) do

  create_table "bookings", force: :cascade do |t|
    t.string "location"
    t.date "date"
    t.integer "pet_id", null: false
    t.integer "renter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_bookings_on_pet_id"
    t.index ["renter_id"], name: "index_bookings_on_renter_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "description"
    t.string "color"
    t.integer "breed_id", null: false
    t.string "picture"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breed_id"], name: "index_pets_on_breed_id"
  end

  create_table "renters", force: :cascade do |t|
    t.string "password_digest"
    t.string "username"
    t.string "name"
    t.string "address"
    t.integer "age"
    t.string "phone_number"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.date "date"
    t.integer "pet_id", null: false
    t.integer "renter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_reviews_on_pet_id"
    t.index ["renter_id"], name: "index_reviews_on_renter_id"
  end

  add_foreign_key "bookings", "pets"
  add_foreign_key "bookings", "renters"
  add_foreign_key "pets", "breeds"
  add_foreign_key "reviews", "pets"
  add_foreign_key "reviews", "renters"
end
