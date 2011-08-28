class UseSmallerDataTypesWherePossible < ActiveRecord::Migration
  def change
    change_column :route_stops, :arrival_hour,   :integer, limit: 1  # -128 to 127
    change_column :route_stops, :arrival_min,    :integer, limit: 1
    change_column :route_stops, :departure_hour, :integer, limit: 1
    change_column :route_stops, :departure_min,  :integer, limit: 1
    change_column :stops,       :order,          :integer, limit: 2  # -32768 to 32767
    change_column :lines,       :color,          :string,  limit: 7
  end
end
