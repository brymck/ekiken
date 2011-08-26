class Station < ActiveRecord::Base
  # Relationships
  has_many :stops
  has_many :lines, through: :stops

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :slug
  accepts_nested_attributes_for :stops, reject_if: lambda { |stop| stop[:line_id].blank? }, allow_destroy: true

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
