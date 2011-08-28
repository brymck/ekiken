class Stop < ActiveRecord::Base
  # Defaults
  default_scope order('"order"') # need to escape "order" otherwise it's taken as a SQL keyword

  # Relationships
  belongs_to :station
  belongs_to :line
  has_many :route_stops

  # Validations
  validates_presence_of :order, :station_id, :line_id
  validates_numericality_of :order, only_integer: true
  validates_uniqueness_of :order, scope: :line_id
end

# == Schema Information
#
# Table name: stops
#
#  id         :integer         not null, primary key
#  order      :integer(2)      not null
#  station_id :integer
#  line_id    :integer
#

