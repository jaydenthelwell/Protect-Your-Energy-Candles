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

ActiveRecord::Schema[7.0].define(version: 2024_03_09_130547) do
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

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
    t.boolean "primary", default: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "candles", force: :cascade do |t|
    t.string "scent"
    t.string "size"
    t.date "date_made"
    t.text "description"
    t.integer "stock"
    t.decimal "price"
    t.integer "edition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["edition_id"], name: "index_candles_on_edition_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "candle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candle_id"], name: "index_images_on_candle_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "candle_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.integer "order_id"
    t.decimal "unit_price"
    t.index ["candle_id"], name: "index_line_items_on_candle_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "session_id"
    t.string "stripe_checkout_id"
    t.string "status", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "line_item_id"
    t.integer "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.integer "candle_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candle_id"], name: "index_reviews_on_candle_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "first_name"
    t.string "second_name"
    t.date "d_o_b"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "images", "candles"
  add_foreign_key "line_items", "candles"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "reviews", "candles"
  add_foreign_key "reviews", "users"
end
