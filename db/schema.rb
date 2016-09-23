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

ActiveRecord::Schema.define(version: 20160912122210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.integer "identifier", null: false
    t.index ["identifier"], name: "index_locations_on_identifier", unique: true, using: :btree
  end

  create_table "segments", force: :cascade do |t|
    t.integer "shelf_id",                              null: false
    t.integer "identifier",                            null: false
    t.string  "interval_begin",                        null: false
    t.string  "interval_end",                          null: false
    t.string  "interval_begin_computed",               null: false
    t.string  "interval_end_computed",                 null: false
    t.float   "utilisation",             default: 0.0, null: false
    t.integer "width",                   default: 100, null: false
    t.integer "no_of_levels"
    t.index ["identifier", "shelf_id"], name: "index_segments_on_identifier_and_shelf_id", unique: true, using: :btree
    t.index ["interval_begin"], name: "index_segments_on_interval_begin", using: :btree
    t.index ["interval_begin_computed"], name: "index_segments_on_interval_begin_computed", using: :btree
    t.index ["interval_end"], name: "index_segments_on_interval_end", using: :btree
    t.index ["interval_end_computed"], name: "index_segments_on_interval_end_computed", using: :btree
    t.index ["shelf_id"], name: "index_segments_on_shelf_id", using: :btree
  end

  create_table "shelves", force: :cascade do |t|
    t.integer "location_id",             null: false
    t.integer "identifier",              null: false
    t.string  "interval_begin"
    t.string  "interval_end"
    t.string  "interval_begin_computed"
    t.string  "interval_end_computed"
    t.index ["identifier", "location_id"], name: "index_shelves_on_identifier_and_location_id", unique: true, using: :btree
    t.index ["interval_begin"], name: "index_shelves_on_interval_begin", using: :btree
    t.index ["interval_begin_computed"], name: "index_shelves_on_interval_begin_computed", using: :btree
    t.index ["interval_end"], name: "index_shelves_on_interval_end", using: :btree
    t.index ["interval_end_computed"], name: "index_shelves_on_interval_end_computed", using: :btree
    t.index ["location_id"], name: "index_shelves_on_location_id", using: :btree
  end

  add_foreign_key "segments", "shelves"
  add_foreign_key "shelves", "locations"
end
