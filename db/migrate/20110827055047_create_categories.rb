# coding: utf-8

class CreateCategories < ActiveRecord::Migration
  def change
    # Categories
    create_table :categories do |t|
      t.string :kanji
      t.string :kana
      t.string :romaji
    end

    Category.create! kanji: "普通", kana: "ふつう",     romaji: "Local"
    Category.create! kanji: "快速", kana: "かいそく",   romaji: "Rapid"
    Category.create! kanji: "急行", kana: "きゅうこう", romaji: "Express"
    Category.create! kanji: "特急", kana: "とっきゅう", romaji: "Limited Express"

    # Day types
    create_table :day_types do |t|
      t.string :kanji
      t.string :kana
      t.string :romaji
      t.boolean :monday,    null: false, default: false
      t.boolean :tuesday,   null: false, default: false
      t.boolean :wednesday, null: false, default: false
      t.boolean :thursday,  null: false, default: false
      t.boolean :friday,    null: false, default: false
      t.boolean :saturday,  null: false, default: false
      t.boolean :sunday,    null: false, default: false
      t.boolean :holiday,   null: false, default: false
    end

    DayType.create! kanji: "平日", kana: "へいじつ",   romaji: "Weekdays", monday: true, tuesday: true, wednesday: true, thursday: true, friday: true 
    DayType.create! kanji: "土日", kana: "どにち",     romaji: "Weekends", saturday: true, sunday: true
    DayType.create! kanji: "休日", kana: "きゅうじつ", romaji: "Holidays", holiday: true

    # Routes
    create_table :routes do |t|
      t.references :line
      t.references :day_type
    end
    add_index :routes, :line_id

    # Route stops
    create_table :route_stops do |t|
      t.references :route
      t.references :stop
      t.integer :arrival
      t.integer :departure
    end
    add_index :route_stops, :route_id
    add_index :route_stops, :stop_id
    add_index :route_stops, [:route_id, :stop_id], unique: true
  end
end
