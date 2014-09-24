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

ActiveRecord::Schema.define(version: 20140922075251) do

  create_table "backlogs", force: true do |t|
    t.string   "custname"
    t.integer  "product_id"
    t.string   "productCode"
    t.string   "sono"
    t.date     "orderDate"
    t.integer  "orderAmt"
    t.integer  "backlog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internal_values", force: true do |t|
    t.string   "category"
    t.string   "name"
    t.string   "value"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "product_id"
    t.string   "code"
    t.integer  "inventory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: true do |t|
    t.string   "name"
    t.float    "workdays",   limit: 24
    t.float    "workhours",  limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.float    "estWeight",  limit: 24
    t.integer  "machine_id"
    t.float    "speed",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "backlog_id"
    t.string   "sono"
    t.string   "productCode"
    t.date     "deliveryDate"
    t.integer  "priority"
    t.integer  "amt"
    t.integer  "seq"
    t.string   "scheduler"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
