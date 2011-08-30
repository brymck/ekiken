class ChangeTimesInRouteStops < ActiveRecord::Migration
  def up
    remove_column :route_stops, :arrival_hour
    remove_column :route_stops, :arrival_min
    remove_column :route_stops, :departure_hour
    remove_column :route_stops, :departure_min
    add_column    :route_stops, :minutes,        :integer, limit: 2
    add_column    :route_stops, :wait,           :integer, limit: 1

    RouteStop.all.each do |stop|
      stop.update_attribute :minutes, 0
    end

    change_column :route_stops, :minutes,        :integer, limit: 2, null: false
  end

  def down
    remove_column :route_stops, :minutes
    remove_column :route_stops, :wait
    add_column    :route_stops, :arrival_hour,   :integer, limit: 1
    add_column    :route_stops, :arrival_min,    :integer, limit: 1
    add_column    :route_stops, :departure_hour, :integer, limit: 1
    add_column    :route_stops, :departure_min,  :integer, limit: 1
  end
end
