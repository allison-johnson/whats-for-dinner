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

ActiveRecord::Schema.define(version: 2020_03_22_043017) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.string "quantity"
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.text "content"
    t.integer "recipe_id"
    t.integer "step_number"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "instructions"
    t.integer "owner_id"
    t.integer "category_id"
    t.integer "num_steps"
    t.integer "num_ingredients"
  end

  create_table "user_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
