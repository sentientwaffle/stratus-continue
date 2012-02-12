# config:
# 
#   * `continue` - `Object`
# 
stratus = require 'stratus'

DEFAULT =
  continue:
    Bash:         {"^\\s*# ": "# "}
    C:            {"^\\s*[*] .*(?![*]/)": "* "}
    "C.PlusPlus": {"^\\s*// ":  "// "}
    CoffeeScript: {"^\\s*# ":   "# "}
    CSS:          {"^\\s*[ /][*](?!.*[*]/)": "* "}
    Haskell:      {"^\\s*[-]{2} ": "-- "}
    Jade:         {"^\\s*// ":  "// "}
    Java:         
      { "^\\s*[*]": "* "
      , "^\\s*// ":  "// "
      }
    JavaScript:   {"^\\s*// ":  "// "}
    Markdown: 
      { "^\\s*[*] ": "* "
      , "^\\s*[-] ": "- "
      , "^\\s*[+] ": "+ "
      }
    Python:       {"^\\s*# ": "# "}
    Racket:
      { "^\\s*; ":  "; "
      , "^\\s*;; ": ";; "
      }
    Ruby:         {"^\\s*# ": "# "}
    Stylus:       {"^\\s*// ": "// "}


_.extend DEFAULT["continue"], (window.data.config["continue"] || {})
CONTS = DEFAULT["continue"]

stratus.on "fractus.key.\n", (editor) ->
  syntax           = editor.syntax?.name
  {buffer, cursor} = editor
  row              = cursor.point.row
  prevLine         = buffer.text row - 1
  
  bundleParts = []
  parts       = syntax.split(".")
  for part in parts
    bundleParts.push part
    bundleName = bundleParts.join "."
    continue unless conts = CONTS[bundleName]
    if (new RegExp("^#{bundleName}\\b")).test bundleName
      for match, insert of conts
        if (new RegExp(match)).test prevLine
          cursor.insert insert
          return
  return
