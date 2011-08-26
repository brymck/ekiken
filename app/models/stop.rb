class Stop < ActiveRecord::Base
  # Defaults
  default_scope order('"order"') # need to escape "order" otherwise it's taken as a SQL keyword

  # Relationships
  belongs_to :station
  belongs_to :line

  # Validations
  validates_presence_of :order
end
