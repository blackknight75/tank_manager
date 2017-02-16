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

ActiveRecord::Schema.define(version: 20170216215656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.string "purchase_date"
    t.string "purchase_store"
    t.string "temperament"
    t.string "breed"
  end

  create_table "tanks", force: :cascade do |t|
    t.string   "name"
    t.string   "dimensions"
    t.string   "gallons"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tanks", ["user_id"], name: "index_tanks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "tanks", "users"
end