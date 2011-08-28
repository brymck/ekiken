class Company < ActiveRecord::Base
  # Relationships
  has_many :lines

  # Validations
  validates_presence_of :kanji, :kana, :romaji, :ascii, :slug
  validates_uniqueness_of :slug

  # Library
  waei :parameterize, :sortable
end

# == Schema Information
#
# Table name: companies
#
#  id     :integer         primary key
#  kanji  :string(255)
#  kana   :string(255)
#  romaji :string(255)
#  ascii  :string(255)
#  slug   :string(255)
#

