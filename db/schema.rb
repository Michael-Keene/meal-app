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

ActiveRecord::Schema[7.0].define(version: 2022_05_13_174914) do
  create_table "food_consumption_events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "food_id", null: false
    t.float "grams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_food_consumption_events_on_food_id"
    t.index ["user_id"], name: "index_food_consumption_events_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.float "fat"
    t.float "carbs"
    t.float "fibre"
    t.float "protein"
    t.float "calories"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "food_id", null: false
    t.float "grams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_ingredients_on_food_id"
    t.index ["meal_id"], name: "index_ingredients_on_meal_id"
  end

  create_table "meal_consumption_events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_consumption_events_on_meal_id"
    t.index ["user_id"], name: "index_meal_consumption_events_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_entries", force: :cascade do |t|
    t.integer "searchable_id"
    t.string "searchable_type"
    t.string "searchable_name"
    t.string "searchable_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_meal_associations", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "shopping_list_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_shopping_meal_associations_on_meal_id"
    t.index ["shopping_list_id"], name: "index_shopping_meal_associations_on_shopping_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "fat", default: 60.0
    t.float "carbs", default: 270.0
    t.float "fibre", default: 30.0
    t.float "protein", default: 90.0
    t.float "calories", default: 2000.0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "food_consumption_events", "foods"
  add_foreign_key "food_consumption_events", "users"
  add_foreign_key "ingredients", "foods"
  add_foreign_key "ingredients", "meals"
  add_foreign_key "meal_consumption_events", "meals"
  add_foreign_key "meal_consumption_events", "users"
  add_foreign_key "shopping_meal_associations", "meals"
  add_foreign_key "shopping_meal_associations", "shopping_lists"

  create_view "ingredient_macros", sql_definition: <<-SQL
      SELECT ingredients.grams*foods.fat/100 as fat,
   ingredients.grams*foods.fibre/100 as fibre,
   ingredients.grams*foods.carbs/100 as carbs,
   ingredients.grams*foods.calories/100 as calories,
   ingredients.grams*foods.protein/100 as protein,
   ingredients.id as ingredient_id
  FROM ingredients INNER JOIN foods on ingredients.food_id=foods.id
  SQL
end
