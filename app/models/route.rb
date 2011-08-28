class Route < ActiveRecord::Base
  # Relationships
  belongs_to :line
  belongs_to :day_type
  belongs_to :category
  has_many :route_stops

  # Validations
  accepts_nested_attributes_for :route_stops, reject_if: lambda { |rs| rs[:arrival_hour].blank? }, allow_destroy: true
  validates_presence_of :line

  def from
    route_stops.first.stop.station.name unless route_stops.empty?
  end

  def to
    route_stops.last.stop.station.name unless route_stops.empty?
  end

  def order_stops(order = "asc")
    if order == "desc"
      stops = line.stops.reverse
    else
      stops = line.stops
    end

    route_stops.each_with_index do |rs, i|
      s = stops[i]
      rs.stop_id = s.id unless s.nil?
    end
  end
end

# == Schema Information
#
# Table name: routes
#
#  id          :integer         primary key
#  line_id     :integer
#  day_type_id :integer
#  category_id :integer
#

