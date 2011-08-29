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

  MAX_RESULTS = 5

  def paths(station)
    results = []
    checked_stations = []
    checked_lines = []
    lines.each do |l|
      unless l.in?(checked_lines)
        if l.goes_to?(station)
          results << [{ station: self, line: l }, { station: station }]
          return results if results.length >= MAX_RESULTS
        end
        checked_lines << l
      end
    end
    checked_stations << self

    lines.each do |l|
      l.stations.each do |s|
        unless s.in?(checked_stations)
          s.lines.each do |l2|
            unless l2.in?(checked_lines)
              if l2.goes_to?(station)
                results << [{ station: self, line: l }, { station: s, line: l2 }, { station: station }]
                return results if results.length >= MAX_RESULTS
              end
              checked_lines << l2
            end
          end
          checked_stations << s
        end
      end
    end
    results
  end
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

