# coding: utf-8

module Waei
  module Transliteration
    def to_param
      slug.parameterize
    end

    def name
      I18n.locale == :ja ? kanji : romaji
    end

    def sort_name
      n = I18n.locale == :ja ? kana : ascii
      n.nil? ? "" : n.downcase
    end
  end

  def waei
    include Transliteration
  end
end

module ActiveRecord
  class Base
    extend Waei
  end
end
