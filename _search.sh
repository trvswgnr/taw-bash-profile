# -- SEARCHING -- #

alias qfind="find . -name "                 # Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # Find file whose name ends with a given string
 
# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { 
  mdfind "kMDItemDisplayName == '$@'wc";
}
