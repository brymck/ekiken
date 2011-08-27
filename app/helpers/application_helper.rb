module ApplicationHelper
  VALID_HOURS = 0..26
  VALID_MINS  = (0..59).map { |m| [m.to_s.rjust(2, "0"), m] }
  
  def ruby_tag(kanji, kana)
    "<ruby>#{kanji}<rp>(</rp><rt>#{kana}</rt><rp>)</rp></ruby>".html_safe
  end

  def hour_min_tag(form, hour_sym, min_sym)
    html  = form.select(hour_sym, VALID_HOURS, { include_blank: true })
    html << ":"
    html << form.select(min_sym, VALID_MINS,  { include_blank: true })
    html.html_safe
  end
end
