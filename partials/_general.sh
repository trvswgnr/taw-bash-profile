# -- MAKE TERMINAL BETTER -- #

# navigation
cd() { builtin cd "$@"; ls -Gp --color; }  # Always list directory contents upon 'cd'
alias cd..='cd ../'            # Go back 1 directory level
alias ..='cd ../'              # Go back 1 directory level (alias)
alias ...='cd ../../'          # Go back 2 directory levels
alias .='cd' # much small, very shorthand

# listing
alias ls='ls -Gp --color=auto'     # show files and folders in directory as grid
alias ll='ls -FGlAhp' # show files and foders in a list
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less' # full recursive directory listing
alias lsa='ls -Gpa'

alias c='clear'                           # clear terminal display
alias path='echo -e ${PATH//:/\\n}'       # echo all executable Paths
alias show_options='shopt'                # display bash options settings
alias fix_stty='stty sane'                # restore terminal settings when screwed up

# edit and load the current bash profile
alias edit_profile='edit ~/.bash_profile'
alias load_profile='source ~/.bash_profile'

# Navigate to the MAMP websites folder
alias htdocs='cd /Applications/MAMP/htdocs/'
alias sites='htdocs'

# change the terminal prompt
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
SEAFOAM="\[\033[0;34m\]"
NO_COLOR="\[\033[0m\]"
MAGENTA="\[\033[0;31m\]"
GOLD="\[\033[0;32m\]"
BLUE="\[\033[0;33m\]"

export PS1="$NO_COLOR----------------------------------\n$MAGENTA\u$GOLD \W$BLUE\$(parse_git_branch)$SEAFOAM \$$NO_COLOR "

# just a test function to make sure the file is included and working
testing() { echo 'testing 1 2 3'; }

# search in history, or show last 10 history items if no var
h() {
  if [ -z "$1" ]; then
    history 15
  else
    history | grep $1
  fi
}
