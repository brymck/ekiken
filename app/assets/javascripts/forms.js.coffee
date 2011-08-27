# Convert romaji to slug
NON_LETTERS = /[^a-z]+/gi # any series of non-lowercase-letters
MACRONS =
  A: /Ā/g
  a: /ā/g
  E: /Ē/g
  e: /ē/g
  I: /Ī/g
  i: /ī/g
  O: /Ō/g
  o: /ō/g
  U: /Ū/g
  u: /ū/g
LINE_SUFFIX = /[\s-]line$/i

$romaji = $("[id$=_romaji]")
$ascii  = $("[id$=_ascii]")
$slug   = $("[id$=_slug]")

normalize = (text) ->
  console.log MACRONS
  text = text.replace search, replace for own replace, search of MACRONS
  text.replace NON_LETTERS, '-'

$romaji.keyup ->
  text = normalize $romaji.val()
  $ascii.val text
  $slug.val  text.toLowerCase().replace LINE_SUFFIX, ""
