UP_KEY     = 38
DOWN_KEY   = 40
ENTER_KEY  = 13
SPACE_KEY  = 32
TAB_KEY    =  9
SLUG_INDEX =  0
NAME_INDEX =  1

$final = $("#final")

get_final = (url, $form) ->
  $.get url, $form.serialize(), (paths) ->
    $final.empty()
    for path in paths
      $tr = $("<tr>")
      for leg in path
        $tr.append("<td class='station'><a href='#{leg.station.link}'>#{leg.station.name}</a></td>")
        if leg.line
          connector = "<td><span class='connector' style='background-color:#{leg.line.color}'></span></td>"
          $tr
            .append(connector)
            .append("<td class='line'><a href='#{leg.line.link}'>#{leg.line.name}</a></td>")
            .append(connector)
      $final.append $tr

$ ->
  $("form").each ->
    $form = $(@)
    url = "#{$form.attr("action")}.json"
    $form.find(".search").each ->
      $search   = $(@)
      $result   = $search.find(".result")
      $query    = $search.find(".query")
      $slug     = $search.find(".slug")
      $lis      = null
      index     = -1
      count     = -1
      down_text = ""

      $query.keydown (event) ->
        down_text = $query.val()
        switch event.which
          when UP_KEY
            index--
            index = count - 1 if index < -1
            event.preventDefault()
          when DOWN_KEY
            index++
            index = -1 if index >= count
            event.preventDefault()
          when TAB_KEY
            # Use the first match if none selected
            index = 0 if index < 0

            if index < count
              $li = $lis.eq(index)
              $query.val($li.text()).addClass "selected"
              $slug.val $li.data("slug")
              get_final url, $form
            $result.empty()
            count =  0
            index = -1
          when SPACE_KEY
            if index > -1
              $li = $lis.eq(index)
              $query.val($li.text()).addClass "selected"
              $slug.val $li.data("slug")
              get_final url, $form
              $result.empty()
              count =  0
              index = -1
              event.preventDefault()
          else
            return

        # Reset down text so we don't require after using space bar
        down_text = $query.val()

        $lis.removeClass "selected"
        $lis.eq(index).addClass("selected") unless index is -1

      $query.keyup (event) ->
        up_text = $query.val()

        # Only run if the keystroke has actually altered the data
        if up_text isnt down_text
          $query.removeClass "selected"
          index = -1
          if up_text is ""
            $result.empty()
          else
            $.get url, q: $(@).val(), (data) ->
              $result.empty()
              $result.append "<li data-slug='#{datum[SLUG_INDEX]}'>#{datum[NAME_INDEX]}</li>" for datum in data
              $lis = $result.find("li")
              count = data.length
