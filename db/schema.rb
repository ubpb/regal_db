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

ActiveRecord::Schema.define(version: 2018_05_15_153751) do

  create_table "locations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "identifier", null: false
    t.string "display_name"
    t.boolean "closed_stack", default: false, null: false
    t.string "collection_codes"
    t.text "notes"
    t.index ["identifier"], name: "index_locations_on_identifier", unique: true
  end

  create_table "segments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "shelf_id", null: false
    t.integer "identifier", null: false
    t.string "interval_begin"
    t.string "interval_end"
    t.float "utilisation", default: 0.0, null: false
    t.integer "width", default: 100, null: false
    t.integer "no_of_levels"
    t.text "notes"
    t.string "special_usage"
    t.index ["identifier", "shelf_id"], name: "index_segments_on_identifier_and_shelf_id", unique: true
    t.index ["interval_begin"], name: "index_segments_on_interval_begin"
    t.index ["interval_end"], name: "index_segments_on_interval_end"
    t.index ["shelf_id"], name: "index_segments_on_shelf_id"
  end

  create_table "shelves", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "identifier", null: false
    t.index ["identifier", "location_id"], name: "index_shelves_on_identifier_and_location_id", unique: true
    t.index ["location_id"], name: "index_shelves_on_location_id"
  end

  add_foreign_key "segments", "shelves"
  add_foreign_key "shelves", "locations"
end
