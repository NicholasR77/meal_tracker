# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_17_022230) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.integer "total_fat"
    t.integer "cholesterol"
    t.integer "sodium"
    t.integer "total_carbs"
    t.integer "protein"
  end

  create_table "meal_items", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "item_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "height"
    t.integer "weight"
    t.string "email"
    t.string "password_digest"
  end

end
