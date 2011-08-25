module ApplicationHelper
  def ruby_tag(kanji, kana)
    "<ruby>#{kanji}<rp>(</rp><rt>#{kana}</rt><rp>)</rp></ruby>".html_safe
  end
end
