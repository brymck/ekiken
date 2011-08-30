class RouteStop < ActiveRecord::Base
  # Defaults
  default_scope order("minutes")

  # Relationships
  belongs_to :route
  belongs_to :stop

  # Validations
  validates_presence_of :minutes
  validates_numericality_of :minutes, only_integer: true

  def arrival_hour
    if minutes.nil?
      nil
    else
      minutes / 60
    end
  end

  def arrival_min
    if minutes.nil?
      nil
    else
      minutes % 60
    end
  end

  def departure_hour
    if minutes.nil? || wait.nil?
      nil
    else
      (minutes + wait) / 60
    end
  end

  def departure_min
    if minutes.nil? || wait.nil?
      nil
    else
      (minutes + wait) % 60
    end
  end
end


# == Schema Information
#
# Table name: route_stops
#
#  id       :integer         not null, primary key
#  route_id :integer
#  stop_id  :integer
#  minutes  :integer(2)
#  wait     :integer(1)
#

