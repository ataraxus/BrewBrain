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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_052831) do
  create_table "batch_steps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "resource_id", null: false
    t.integer "batch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_steps_on_batch_id"
    t.index ["resource_id"], name: "index_batch_steps_on_resource_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "state"
    t.boolean "finished"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "text"
    t.string "reference_type", null: false
    t.integer "reference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_type", "reference_id"], name: "index_comments_on_reference"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "executed_steps", force: :cascade do |t|
    t.string "name"
    t.integer "state"
    t.datetime "executed_at"
    t.integer "user_id", null: false
    t.integer "batch_id", null: false
    t.integer "process_step_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_executed_steps_on_batch_id"
    t.index ["process_step_id"], name: "index_executed_steps_on_process_step_id"
    t.index ["user_id"], name: "index_executed_steps_on_user_id"
  end

  create_table "formula_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formula_ingredients", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.decimal "percentage", precision: 6, scale: 4
    t.integer "formula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formula_id"], name: "index_formula_ingredients_on_formula_id"
    t.index ["ingredient_id"], name: "index_formula_ingredients_on_ingredient_id"
  end

  create_table "formula_steps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "formula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formula_id"], name: "index_formula_steps_on_formula_id"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "state"
    t.text "description"
    t.string "lot_number"
    t.decimal "amount_in_kg", precision: 7, scale: 3
    t.integer "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_resources_on_ingredient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "batch_steps", "batches"
  add_foreign_key "batch_steps", "resources"
  add_foreign_key "comments", "users"
  add_foreign_key "executed_steps", "batches"
  add_foreign_key "executed_steps", "process_steps"
  add_foreign_key "executed_steps", "users"
  add_foreign_key "formula_ingredients", "formulas"
  add_foreign_key "formula_ingredients", "ingredients"
  add_foreign_key "formula_steps", "formulas"
  add_foreign_key "resources", "ingredients"
end
