class RouteStop < ActiveRecord::Base
  # Defaults
  default_scope order('"arrival_hour" * 60 + "arrival_min"')

  # Relationships
  belongs_to :route
  belongs_to :stop

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
