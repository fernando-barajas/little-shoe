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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_065946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventory_transactions", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventory_transactions_on_product_id"
    t.index ["store_id"], name: "index_inventory_transactions_on_store_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_items", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "product_id"
    t.integer "count_on_hand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stock_items_on_product_id"
    t.index ["store_id", "product_id"], name: "index_stock_items_on_store_id_and_product_id", unique: true
    t.index ["store_id"], name: "index_stock_items_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_transactions", "products"
  add_foreign_key "inventory_transactions", "stores"
  add_foreign_key "stock_items", "products"
  add_foreign_key "stock_items", "stores"
end
