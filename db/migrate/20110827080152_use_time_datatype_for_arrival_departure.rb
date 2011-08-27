class UseTimeDatatypeForArrivalDeparture < ActiveRecord::Migration
  def change
    remove_column :route_stops, :arrival
    remove_column :route_stops, :departure
    add_column :route_stops, :arrival_hour,   :integer
    add_column :route_stops, :arrival_min,    :integer
    add_column :route_stops, :departure_hour, :integer
    add_column :route_stops, :departure_min,  :integer
  end
end
