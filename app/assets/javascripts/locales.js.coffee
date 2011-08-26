_lang = null

window.lang = -> _lang ?= $("html").attr("lang")
