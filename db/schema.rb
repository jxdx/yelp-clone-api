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

ActiveRecord::Schema.define(version: 2021_05_28_052436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_restaurant_categories_on_category_id"
    t.index ["restaurant_id"], name: "index_restaurant_categories_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "business_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "latitude"
    t.string "longitude"
    t.float "stars"
    t.integer "review_count"
    t.integer "is_open"
    t.json "restaurant_attributes"
    t.json "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review_id"
    t.string "user_id"
    t.string "business_id"
    t.float "stars"
    t.integer "useful"
    t.integer "funny"
    t.integer "cool"
    t.string "text"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id", "user_id", "review_id"], name: "index_reviews_on_business_id_and_user_id_and_review_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "restaurant_categories", "categories"
  add_foreign_key "restaurant_categories", "restaurants"
end
