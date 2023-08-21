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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_142323) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "batch_steps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "step_number"
    t.integer "formula_step_id", null: false
    t.integer "resource_id", null: false
    t.integer "batch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_steps_on_batch_id"
    t.index ["formula_step_id"], name: "index_batch_steps_on_formula_step_id"
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

  create_table "formula_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formula_ingredients", force: :cascade do |t|
    t.integer "index"
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
    t.integer "step_number"
    t.integer "formula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formula_id"], name: "index_formula_steps_on_formula_id"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "state"
    t.integer "formula_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formula_category_id"], name: "index_formulas_on_formula_category_id"
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

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batch_steps", "batches"
  add_foreign_key "batch_steps", "formula_steps"
  add_foreign_key "batch_steps", "resources"
  add_foreign_key "comments", "users"
  add_foreign_key "formula_ingredients", "formulas"
  add_foreign_key "formula_ingredients", "ingredients"
  add_foreign_key "formula_steps", "formulas"
  add_foreign_key "formulas", "formula_categories"
  add_foreign_key "resources", "ingredients"
end
