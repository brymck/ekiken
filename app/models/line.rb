class Line < ActiveRecord::Base
  # Relationships
  belongs_to :company
  has_many :stops
  has_many :stations, through: :stops
  has_many :routes

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug
  validates_uniqueness_of :slug
  validates_format_of :color, with: /\A#[0-9a-f]{3,6}\Z/i
  accepts_nested_attributes_for :stops, reject_if: lambda { |s| s[:station_id].blank? }, allow_destroy: true

  # Library
  waei :parameterize, :sortable
end
