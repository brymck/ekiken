class Company < ActiveRecord::Base
  # Relationships
  has_many :lines

  # Library
  waei
end
