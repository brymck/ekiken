# Convert romaji to slug
NON_LETTERS = /[^a-z]+/gi # any series of non-lowercase-letters
O_KEY = 79
U_KEY = 85
MACRON_O_CAPS = "\u014c"
MACRON_O      = "\u014d"
MACRON_U_CAPS = "\u016a"
MACRON_U      = "\u016b"

MACRONS =
  A: /\u0100/g
  a: /\u0101/g
  E: /\u0112/g
  e: /\u0113/g
  I: /\u012a/g
  i: /\u012b/g
  O: /\u014c/g
  o: /\u014d/g
  U: /\u016a/g
  u: /\u016b/g
LINE_SUFFIX = /[\s-]line$/i

$romaji = $("[id$=_romaji]")
$ascii  = $("[id$=_ascii]")
$slug   = $("[id$=_slug]")

$romaji.keyup ->
  text = $romaji.val()
  text = text.replace search, replace for own replace, search of MACRONS
  $ascii.val text
  text = text.toLowerCase().replace(NON_LETTERS, '-').replace(LINE_SUFFIX, "")
  $slug.val  text

$(".macron").keydown (event) ->
  if event.ctrlKey and (event.which is O_KEY or event.which is U_KEY)
    if event.which is O_KEY
      macron = if event.shiftKey then MACRON_O_CAPS else MACRON_O
    else
      macron = if event.shiftKey then MACRON_U_CAPS else MACRON_U
    value = @.value
    sel   = @.selectionStart
    @.value = value.substring(0, sel) + macron + value.substring(sel)
    @.selectionStart = @.selectionEnd = sel + 1
    event.preventDefault()
