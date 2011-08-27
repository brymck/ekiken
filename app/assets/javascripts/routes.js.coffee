change_by_minutes = ($tr, change) ->
  $hours = $tr.find("select[id$=_hour]")
  $mins  = $tr.find("select[id$=_min]")
  $mins.each (i, min)->
    $min = $(min)
    val = $min.val()
    unless val == ""
      val = parseInt(val) + change
      if val >= 60
        val -= 60
        $hour = $hours.eq(i)
        hour_val = $hour.val()
        $hour.val(parseInt(hour_val) + 1) unless hour_val == ""
      else if val < 0
        val += 60
        $hour = $hours.eq(i)
        hour_val = $hour.val()
        $hour.val(parseInt(hour_val) - 1) unless hour_val == ""
      $min.val val

add_one_minute_to_all = (event) ->
  $("tr").each (i, tr) ->
    change_by_minutes $(tr), 1
  event.preventDefault()

subtract_one_minute_from_all = (event) ->
  $("tr").each (i, tr) ->
    change_by_minutes $(tr), -1
  event.preventDefault()

add_one_minute_to_one = (event) ->
  $tr = $(@).closest("tr")
  change_by_minutes $tr, 1
  event.preventDefault()

subtract_one_minute_from_one = (event) ->
  $tr = $(@).closest("tr")
  change_by_minutes $tr, -1
  event.preventDefault()

$ ->
  # Expand table header so we still have a valid DOM
  $("form thead tr").each (i, tr) -> $(tr).append "<th></th><th></th>"

  $("select[id$=_arrival_hour]").each (i, select) ->
    $(select).closest("tr").each (i, tr) ->
      $tr = $(tr)
      $a_add       = $('<a href="#">Add one</a>').click add_one_minute_to_one
      $td_add      = $("<td>").append $a_add
      $a_subtract  = $('<a href="#">Subtract one</a>').click subtract_one_minute_from_one
      $td_subtract = $("<td>").append $a_subtract
      $tr.append($td_add).append($td_subtract)
  $a_add_all       = $('<a href="#">Add one to all</a>').click add_one_minute_to_all
  $li_add_all      = $("<li>").append $a_add_all
  $a_subtract_all  = $('<a href="#">Subtract one from all</a>').click subtract_one_minute_from_all
  $li_subtract_all = $("<li>").append $a_subtract_all
  $("#controls").append($li_add_all).append("\n").append($li_subtract_all)
