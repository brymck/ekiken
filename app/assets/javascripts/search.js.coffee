UP_KEY     = 38
DOWN_KEY   = 40
ENTER_KEY  = 13
SPACE_KEY  = 32
TAB_KEY    =  9
SLUG_INDEX =  0
NAME_INDEX =  1

$ ->
  $("form").each ->
    $form = $(@)
    url = "#{$form.attr("action")}.json"
    $form.find(".search").each ->
      $search   = $(@)
      $result   = $search.find(".result")
      $query    = $search.find(".query")
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
              $query.val $lis.eq(index).text()
              $query.addClass "selected"
            $result.empty()
            count =  0
            index = -1
          when SPACE_KEY
            if index > -1
              $query.val $lis.eq(index).text()
              $query.addClass "selected"
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
