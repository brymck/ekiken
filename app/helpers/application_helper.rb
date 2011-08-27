module ApplicationHelper
  VALID_HOURS = 0..26
  VALID_MINS  = (0..59).map { |m| [m.to_s.rjust(2, "0"), m] }
  KANA_CODEPOINTS = 12353..12532
  
  def ruby_tag(kanji, kana)
    kanji_chars = kanji.each_char.to_a
    kana_chars = kana.each_char.to_a
    beginning = []
    ending = []

    # Match beginning kana
    while kanji_chars[0] == kana_chars[0]
      beginning.push kanji_chars.shift
      kana_chars.shift
    end

    # Match ending kana
    while kanji_chars[-1] == kana_chars[-1]
      ending.unshift kanji_chars.pop
      kana_chars.pop
    end

    "#{beginning.join}<ruby>#{kanji_chars.join}<rp>(</rp><rt>#{kana_chars.join}</rt><rp>)</rp></ruby>#{ending.join}".html_safe
  end

  def hour_min_tag(form, hour_sym, min_sym)
    html  = form.select(hour_sym, VALID_HOURS, { include_blank: true })
    html << ":"
    html << form.select(min_sym, VALID_MINS,  { include_blank: true })
    html.html_safe
  end
end
