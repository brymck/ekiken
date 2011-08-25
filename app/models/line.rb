class Line < ActiveRecord::Base
  # Relationships
  has_and_belongs_to_many :stations

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug
  validates_format_of :color, with: /\A#[0-9a-f]{3,6}\Z/i

  def to_param
    slug.parameterize
  end
end
