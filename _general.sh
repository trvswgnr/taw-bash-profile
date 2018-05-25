# -- MAKE TERMINAL BETTER -- #

# makes tab-completion case-insensitive
set completion-ignore-case On

# navigation
cd() { builtin cd "$@"; ls -Gp; }  # Always list directory contents upon 'cd'
alias cd..='cd ../'            # Go back 1 directory level
alias ..='cd ../'              # Go back 1 directory level (alias)
alias ...='cd ../../'          # Go back 2 directory levels
alias .='cd' # much small, very shorthand

# listing
alias ls='ls -Gp'     # show files and folders in directory as grid
alias ll='ls -FGlAhp' # show files and foders in a list
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less' # full recursive directory listing

alias c='clear'                           # clear terminal display
alias path='echo -e ${PATH//:/\\n}'       # echo all executable Paths
alias show_options='shopt'                # display bash options settings
alias fix_stty='stty sane'                # restore terminal settings when screwed up

# edit and load the current bash profile
alias edit_profile='edit ~/.bash_profile'
alias load_profile='source ~/.bash_profile'

# open file in preferred code editor
alias edit='brackets'

# Navigate to the MAMP websites folder
alias htdocs='cd /Applications/MAMP/htdocs/'
alias sites='htdocs'

# use custom nano
alias my="PATH=/usr/local/bin:$PATH"
alias nano="my nano"

# just a test function to make sure the file is included and working
testing() { echo 'testing 1 2 3'; }
