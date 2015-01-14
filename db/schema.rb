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

ActiveRecord::Schema.define(version: 20141126202637) do

  create_table "buy_details", force: true do |t|
    t.integer  "model_id"
    t.integer  "buy_id"
    t.integer  "state_id"
    t.integer  "imei"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buys", force: true do |t|
    t.integer  "member_id"
    t.integer  "customer_id"
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.datetime "end_date"
    t.string   "barcode"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "price"
    t.integer  "buy_id"
    t.integer  "status",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "barcode_read"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "rut"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.integer  "sucursal_id"
    t.integer  "user_id"
    t.integer  "role",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "trademark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.integer  "factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sucursals", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "address"
    t.integer  "contact_number"
    t.string   "email"
    t.string   "responsible_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trademarks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "rut"
    t.string   "username"
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "responsible_name"
    t.integer  "contact_number"
    t.integer  "position",               default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
