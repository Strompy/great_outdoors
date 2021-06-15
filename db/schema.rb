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

ActiveRecord::Schema.define(version: 2021_06_15_235238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "park_searches", force: :cascade do |t|
    t.bigint "park_id"
    t.bigint "search_id"
    t.index ["park_id"], name: "index_park_searches_on_park_id"
    t.index ["search_id"], name: "index_park_searches_on_search_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "longitude"
  end

  create_table "searches", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "park_searches", "parks"
  add_foreign_key "park_searches", "searches"
end
