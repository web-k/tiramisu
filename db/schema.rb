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

ActiveRecord::Schema.define(version: 2013_03_07_021230) do

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "table_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "position_x"
    t.integer "position_y"
    t.string "kind"
    t.integer "table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "latest_moving_user_name"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_name"
    t.integer "channel_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
