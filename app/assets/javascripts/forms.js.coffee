# Convert romaji to slug
NON_LETTERS = /[^a-z]+/g # any series of non-lowercase-letters
MACRONS =
  a: /ā/g
  e: /ē/g
  i: /ī/g
  o: /ō/g
  u: /ū/g
$romaji = $("[id$=_romaji]")
$slug   = $("[id$=_slug]")

normalize = (text) ->
  text = text.toLowerCase()
  text = text.replace value, key for own key, value of MACRONS
  text.replace NON_LETTERS, '-'

$romaji.keyup -> $slug.val normalize $romaji.val()
