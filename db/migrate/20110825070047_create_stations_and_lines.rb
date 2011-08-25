class CreateStationsAndLines < ActiveRecord::Migration
  def change
    # Create station
    create_table :stations do |t|
      t.string :kanji,  null: false
      t.string :kana,   null: false
      t.string :romaji, null: false
      t.float  :latitude
      t.float  :longitude
      t.string :slug,   null: false
    end
    add_index :stations, :kanji,  unique: true
    add_index :stations, :kana,   unique: true
    add_index :stations, :romaji, unique: true
    add_index :stations, :slug,   unique: true

    # Create lines
    create_table :lines do |t|
      t.string :kanji,  null: false
      t.string :kana,   null: false
      t.string :romaji, null: false
      t.string :color
      t.string :slug,   null: false
    end
    add_index :lines, :kanji,  unique: true
    add_index :lines, :kana,   unique: true
    add_index :lines, :romaji, unique: true
    add_index :lines, :slug,   unique: true

    # HABTM table
    create_table :lines_stations, id: false do |t|
      t.references :line,    null: false
      t.references :station, null: false
    end
    add_index :lines_stations, [:line_id, :station_id], unique: true
  end
end
