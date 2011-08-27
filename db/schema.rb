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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110827182304) do

  create_table "categories", :force => true do |t|
    t.string "kanji"
    t.string "kana"
    t.string "romaji"
  end

  create_table "companies", :force => true do |t|
    t.string "kanji"
    t.string "kana"
    t.string "romaji"
    t.string "ascii"
    t.string "slug"
  end

  add_index "companies", ["slug"], :name => "index_companies_on_slug", :unique => true

  create_table "day_types", :force => true do |t|
    t.string  "kanji"
    t.string  "kana"
    t.string  "romaji"
    t.boolean "monday",    :default => false, :null => false
    t.boolean "tuesday",   :default => false, :null => false
    t.boolean "wednesday", :default => false, :null => false
    t.boolean "thursday",  :default => false, :null => false
    t.boolean "friday",    :default => false, :null => false
    t.boolean "saturday",  :default => false, :null => false
    t.boolean "sunday",    :default => false, :null => false
    t.boolean "holiday",   :default => false, :null => false
  end

  create_table "lines", :force => true do |t|
    t.string  "kanji",      :null => false
    t.string  "kana",       :null => false
    t.string  "romaji",     :null => false
    t.string  "color"
    t.string  "slug",       :null => false
    t.string  "ascii"
    t.integer "company_id"
  end

  add_index "lines", ["ascii"], :name => "index_lines_on_ascii"
  add_index "lines", ["company_id"], :name => "index_lines_on_company_id"
  add_index "lines", ["kana"], :name => "index_lines_on_kana", :unique => true
  add_index "lines", ["kanji"], :name => "index_lines_on_kanji", :unique => true
  add_index "lines", ["romaji"], :name => "index_lines_on_romaji", :unique => true
  add_index "lines", ["slug"], :name => "index_lines_on_slug", :unique => true

  create_table "route_stops", :force => true do |t|
    t.integer "route_id"
    t.integer "stop_id"
    t.integer "arrival_hour"
    t.integer "arrival_min"
    t.integer "departure_hour"
    t.integer "departure_min"
  end

  add_index "route_stops", ["route_id", "stop_id"], :name => "index_route_stops_on_route_id_and_stop_id", :unique => true
  add_index "route_stops", ["route_id"], :name => "index_route_stops_on_route_id"
  add_index "route_stops", ["stop_id"], :name => "index_route_stops_on_stop_id"

  create_table "routes", :force => true do |t|
    t.integer "line_id"
    t.integer "day_type_id"
    t.integer "category_id"
  end

  add_index "routes", ["category_id"], :name => "index_routes_on_category_id"
  add_index "routes", ["line_id"], :name => "index_routes_on_line_id"

  create_table "stations", :force => true do |t|
    t.string "kanji",     :null => false
    t.string "kana",      :null => false
    t.string "romaji",    :null => false
    t.float  "latitude"
    t.float  "longitude"
    t.string "slug",      :null => false
    t.string "ascii"
  end

  add_index "stations", ["ascii"], :name => "index_stations_on_ascii"
  add_index "stations", ["kana"], :name => "index_stations_on_kana"
  add_index "stations", ["kanji"], :name => "index_stations_on_kanji"
  add_index "stations", ["romaji"], :name => "index_stations_on_romaji"
  add_index "stations", ["slug"], :name => "index_stations_on_slug", :unique => true

  create_table "stops", :force => true do |t|
    t.integer  "order",      :null => false
    t.integer  "station_id"
    t.integer  "line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stops", ["line_id", "order"], :name => "index_stops_on_line_id_and_order", :unique => true
  add_index "stops", ["line_id"], :name => "index_stops_on_line_id"
  add_index "stops", ["station_id"], :name => "index_stops_on_station_id"

end
