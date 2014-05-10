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

ActiveRecord::Schema.define(version: 20140209030959) do

  create_table "goods", force: true do |t|
    t.string   "title",                                 null: false
    t.string   "brand"
    t.string   "sequence_number"
    t.string   "choices"
    t.binary   "description_j"
    t.binary   "description_c"
    t.string   "source"
    t.integer  "price"
    t.integer  "state",           limit: 1, default: 0, null: false
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id",                              null: false
    t.integer  "good_id",                              null: false
    t.integer  "quantity",                             null: false
    t.integer  "state",          limit: 1, default: 0
    t.string   "deliver_number"
    t.string   "description"
    t.string   "comment"
    t.datetime "accepted_at"
    t.datetime "booked_at"
    t.datetime "delivered_at"
    t.datetime "received_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_variables", force: true do |t|
    t.string   "name",       null: false
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
