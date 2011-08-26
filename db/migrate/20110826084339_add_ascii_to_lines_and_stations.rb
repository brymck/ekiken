class AddAsciiToLinesAndStations < ActiveRecord::Migration
  def change
    add_column :lines, :ascii, :string
    add_index  :lines, :ascii

    add_column :stations, :ascii, :string
    add_index  :stations, :ascii
  end
end
