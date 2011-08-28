class Category < ActiveRecord::Base
  has_many :routes

  waei
end

# == Schema Information
#
# Table name: categories
#
#  id     :integer         primary key
#  kanji  :string(255)
#  kana   :string(255)
#  romaji :string(255)
#

