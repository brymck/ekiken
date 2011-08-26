class CreateStops < ActiveRecord::Migration
  def up
    drop_table :lines_stations

    create_table :stops do |t|
      t.integer :order, null: false
      t.references :station
      t.references :line

      t.timestamps
    end
    add_index :stops, [:line_id, :order], unique: true
    add_index :stops, :station_id
    add_index :stops, :line_id
  end

  def down
    drop_table :stops

    create_table :lines_stations, id: false do |t|
      t.references :line,    null: false
      t.references :station, null: false
    end
    add_index :lines_stations, [:line_id, :station_id], unique: true
  end
end
