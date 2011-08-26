class Line < ActiveRecord::Base
  # Relationships
  has_many :stops
  has_many :stations, through: :stops

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug
  validates_format_of :color, with: /\A#[0-9a-f]{3,6}\Z/i
  accepts_nested_attributes_for :stops, reject_if: lambda { |stop| stop[:station_id].blank? }, allow_destroy: true

  def to_param
    slug.parameterize
  end

  def name
    I18n.locale == :ja ? kanji : romaji
  end

  def sort_name
    I18n.locale == :ja ? kana : romaji
  end
end
