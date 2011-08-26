class Stop < ActiveRecord::Base
  # Relationships
  belongs_to :station
  belongs_to :line

  # Validations
  validates_presence_of :order, :station, :line
end
