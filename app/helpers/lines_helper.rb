module LinesHelper
  def color_tag(color)
    content_tag :span, nil, class: :color, style: "background-color:#{color}"
  end
end
