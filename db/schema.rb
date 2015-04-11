# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150327182349) do

  create_table "brands", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name",      limit: 255, null: false
    t.string "shop_type", limit: 255, null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "quantity",   limit: 4, default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "order_id",   limit: 4,             null: false
    t.integer  "product_id", limit: 4,             null: false
  end

  add_index "order_products", ["order_id"], name: "fk_rails_47b0364e3d", using: :btree
  add_index "order_products", ["product_id"], name: "fk_rails_a44d89a6c0", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4, null: false
  end

  add_index "orders", ["user_id"], name: "fk_rails_b8c7db1846", using: :btree

  create_table "products", force: :cascade do |t|
    t.string  "title",       limit: 255,                                       null: false
    t.integer "imageNum",    limit: 4,                                         null: false
    t.integer "stock",       limit: 4,                           default: 15,  null: false
    t.decimal "price",                   precision: 5, scale: 2, default: 0.0, null: false
    t.integer "brand_id",    limit: 4,                                         null: false
    t.integer "category_id", limit: 4,                                         null: false
  end

  add_index "products", ["brand_id"], name: "fk_rails_63f377794a", using: :btree
  add_index "products", ["category_id"], name: "fk_rails_2cf7562b5a", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255,                                         null: false
    t.string   "last_name",       limit: 255,                                         null: false
    t.string   "email",           limit: 255,                                         null: false
    t.string   "password_digest", limit: 255,                                         null: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.decimal  "balance",                     precision: 5, scale: 2, default: 100.0, null: false
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
end
