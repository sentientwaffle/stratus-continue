# Continue
A [Stratus Editor](http://stratuseditor.com/) plugin to
insert custom text when enter is pressed -- for example, to
continue a comment.

Pressing enter (`|` marks the cursor position)

    # Some comment|

would yield:

    # Some comment
    # |

# Installation

    $ git clone git://github.com/sentientwaffle/stratus-continue.git
    $ stratus plugin:install YOUR_USERNAME stratus-continue

# Configuration

  * `continue` - `Object`. For example, for the previous example,
    the configuration could be
    
        { "continue":
          { Ruby: {"^\\s*# ": "# "}
          }
        }

# License
See LICENSE.
