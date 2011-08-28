class DayType < ActiveRecord::Base
  # Relationships
  has_many :routes

  # Validations
  validates_presence_of :kanji, :kana, :romaji

  # Library
  waei
end

# == Schema Information
#
# Table name: day_types
#
#  id        :integer         primary key
#  kanji     :string(255)
#  kana      :string(255)
#  romaji    :string(255)
#  monday    :boolean         default(FALSE), not null
#  tuesday   :boolean         default(FALSE), not null
#  wednesday :boolean         default(FALSE), not null
#  thursday  :boolean         default(FALSE), not null
#  friday    :boolean         default(FALSE), not null
#  saturday  :boolean         default(FALSE), not null
#  sunday    :boolean         default(FALSE), not null
#  holiday   :boolean         default(FALSE), not null
#

