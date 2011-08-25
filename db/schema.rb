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

ActiveRecord::Schema.define(:version => 20110825070047) do

  create_table "lines", :force => true do |t|
    t.string "kanji",  :null => false
    t.string "kana",   :null => false
    t.string "romaji", :null => false
    t.string "color"
    t.string "slug",   :null => false
  end

  add_index "lines", ["kana"], :name => "index_lines_on_kana", :unique => true
  add_index "lines", ["kanji"], :name => "index_lines_on_kanji", :unique => true
  add_index "lines", ["romaji"], :name => "index_lines_on_romaji", :unique => true
  add_index "lines", ["slug"], :name => "index_lines_on_slug", :unique => true

  create_table "lines_stations", :id => false, :force => true do |t|
    t.integer "line_id",    :null => false
    t.integer "station_id", :null => false
  end

  add_index "lines_stations", ["line_id", "station_id"], :name => "index_lines_stations_on_line_id_and_station_id", :unique => true

  create_table "stations", :force => true do |t|
    t.string "kanji",     :null => false
    t.string "kana",      :null => false
    t.string "romaji",    :null => false
    t.float  "latitude"
    t.float  "longitude"
    t.string "slug",      :null => false
  end

  add_index "stations", ["kana"], :name => "index_stations_on_kana", :unique => true
  add_index "stations", ["kanji"], :name => "index_stations_on_kanji", :unique => true
  add_index "stations", ["romaji"], :name => "index_stations_on_romaji", :unique => true
  add_index "stations", ["slug"], :name => "index_stations_on_slug", :unique => true

end
