class Station < ActiveRecord::Base
  # Relationships
  has_many :stops
  has_many :lines, through: :stops

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug
  validates_uniqueness_of :slug
  accepts_nested_attributes_for :stops, reject_if: lambda { |stop| stop[:line_id].blank? }, allow_destroy: true

  # Library
  waei :parameterize, :sortable
end
