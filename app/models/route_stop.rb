class RouteStop < ActiveRecord::Base
  # Defaults
  default_scope order('"arrival_hour" * 60 + "arrival_min"')

  # Relationships
  belongs_to :route
  belongs_to :stop

  # Validations
  validates_numericality_of :arrival_hour, only_integer: true
  validates_numericality_of :arrival_min,  only_integer: true
  validates_inclusion_of :arrival_hour, in: 0..26
  validates_inclusion_of :arrival_min,  in: 0..59

  def arrival
    arrival_hour * 60 + arrival_min
  end

  def arrival_text
    "#{arrival_hour}:#{arrival_min.to_s.rjust(2, "0")}"
  end

  def departure
    departure_hour * 60 + departure_min
  end

  def departure_text
    "#{departure_hour}:#{departure_min.to_s.rjust(2, "0")}"
  end
end

# == Schema Information
#
# Table name: route_stops
#
#  id             :integer         not null, primary key
#  route_id       :integer
#  stop_id        :integer
#  arrival_hour   :integer(1)
#  arrival_min    :integer(1)
#  departure_hour :integer(1)
#  departure_min  :integer(1)
#

