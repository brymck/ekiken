ADD_ONE_TEXT      = if lang() is "ja" then "プラス1"       else "Add one"
SUBTRACT_ONE_TEXT = if lang() is "ja" then "マイナス1"     else "Subtract one"
ADD_ALL_TEXT      = if lang() is "ja" then "全部プラス1"   else "Add one to all"
SUBTRACT_ALL_TEXT = if lang() is "ja" then "全部マイナス1" else "Subtract one from all"
GUESS_TEXT        = if lang() is "ja" then "推定する"      else "Guess"

change_by_minutes = ($tr, change, event = null) ->
  $hours = $tr.find("select[id$=_hour]")
  $mins  = $tr.find("select[id$=_min]")
  $mins.each (i, min)->
    $min = $(min)
    $hour = $hours.eq i
    min_val  = parseInt $min.val()
    hour_val = parseInt $hour.val()

    # Ignore anything without a blank hour or minute
    unless isNaN(min_val) or isNaN(hour_val)
      min_val += change

      while min_val < 0
        min_val += 60
        hour_val--
      while min_val > 59
        min_val -= 60
        hour_val++

      $min.val  min_val
      $hour.val hour_val
  event.preventDefault() if event?

guess = (event) ->
  $tr = $(@).closest("tr")
  $prev = $tr.prevAll("tr:first")
  return if $prev.size() is 0

  $tr.find("select[id$=_arrival_hour]").val $prev.find("select[id$=_arrival_hour]").val()
  $tr.find("select[id$=_arrival_min]").val  $prev.find("select[id$=_arrival_min]").val()
  prev_index = $prev.find("select[id$=_stop_id]")[0].selectedIndex

  $prev_prev = $prev.prevAll("tr:first")
  if $prev_prev.size() is 0 or prev_index > $prev_prev.find("select[id$=_stop_id]")[0].selectedIndex
    $tr.find("select[id$=_stop_id]")[0].selectedIndex = prev_index + 1
  else
    $tr.find("select[id$=_stop_id]")[0].selectedIndex = prev_index - 1
    
  event.preventDefault()

add_one_minute_to_all        = (event) -> change_by_minutes $("form tbody"),     1, event
subtract_one_minute_from_all = (event) -> change_by_minutes $("form tbody"),    -1, event
add_one_minute_to_one        = (event) -> change_by_minutes $(@).closest("tr"),  1, event
subtract_one_minute_from_one = (event) -> change_by_minutes $(@).closest("tr"), -1, event

$ ->
  # Expand table header so we still have a valid DOM
  $("form thead tr").each (i, tr) -> $(tr).append "<th></th><th></th><th></th>"

  $("select[id$=_arrival_hour]").each (i, select) ->
    $(select).closest("tr").each (i, tr) ->
      $tr = $(tr)
      $a_add       = $("<a href='#'>#{ADD_ONE_TEXT     }</a>").click add_one_minute_to_one
      $td_add      = $("<td>").append $a_add
      $a_subtract  = $("<a href='#'>#{SUBTRACT_ONE_TEXT}</a>").click subtract_one_minute_from_one
      $td_subtract = $("<td>").append $a_subtract
      $a_guess     = $("<a href='#'>#{GUESS_TEXT       }</a>").click guess
      $td_guess    = $("<td>").append $a_guess
      $tr.append($td_add).append($td_subtract).append($td_guess)
  $a_add_all       = $("<a href='#'>#{ADD_ALL_TEXT     }</a>").click add_one_minute_to_all
  $li_add_all      = $("<li>").append $a_add_all
  $a_subtract_all  = $("<a href='#'>#{SUBTRACT_ALL_TEXT}</a>").click subtract_one_minute_from_all
  $li_subtract_all = $("<li>").append $a_subtract_all
  $("#controls").append($li_add_all).append("\n").append($li_subtract_all)
