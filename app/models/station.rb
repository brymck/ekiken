class Station < ActiveRecord::Base
  # Relationships
  has_many :stops
  has_many :lines, through: :stops

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :ascii, :slug
  validates_uniqueness_of :slug
  accepts_nested_attributes_for :stops, reject_if: lambda { |stop| stop[:line_id].blank? }, allow_destroy: true

  # Library
  waei :parameterize, :sortable
end

# == Schema Information
#
# Table name: stations
#
#  id        :integer         primary key
#  kanji     :string(255)     not null
#  kana      :string(255)     not null
#  romaji    :string(255)     not null
#  latitude  :float
#  longitude :float
#  slug      :string(255)     not null
#  ascii     :string(255)
#

