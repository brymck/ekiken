# coding: utf-8

module Waei
  module Parameterize
    def to_param
      slug.parameterize
    end
  end

  module Sortable
    def sort_name
      n = I18n.locale == :ja ? kana : ascii
      n.nil? ? "" : n.downcase
    end
  end

  module Transliteration
    def name
      I18n.locale == :ja ? kanji : romaji
    end
  end

  def waei(*params)
    params.each do |param|
      case param
      when :parameterize
        include Parameterize
      when :sortable
        include Sortable
      end
    end
    include Transliteration
  end
end

module ActiveRecord
  class Base
    extend Waei
  end
end
