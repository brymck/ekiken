class Station < ActiveRecord::Base
  # Relationships
  has_and_belongs_to_many :lines

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug

  def to_param
    slug.parameterize
  end
end
