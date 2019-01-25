# -- OTHER -- #

# macvim
alias macvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# slack cli
alias slack='slackadaisical'

# trello cli
export TRELLO_USER=travisawagner
export TRELLO_KEY=a33c559d42a8c233f2b2500c7a855252
export TRELLO_TOKEN=e1ecc7f8ebc790692de64cd678d7115c42c5def97881d3e9e7a63a2a45bd8e96
alias trello='3llo'

# default mail client
alias mail='alpine'

# control spotify opened on any device from command line
alias spotify='spotctl'

# adds MongoDB to the PATH (user specific)
# export PATH=/Users/travis/mongodb-osx-x86_64-3.2.6/bin:$PATH

# Search manpage given in agument '1' for term given in argument '2' (case insensitive)
# displays paginated result with colored search terms and two lines surrounding each hit.
# Example: mans mplayer codec
mans () {
  man $1 | grep -iC2 --color=always $2 | less
}

# show the alias of some part (given some part of it)
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_profile | grep -v '^\s*$' | less -FSRXc ; }

# --WEB DEVELOPMENT -- #

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # Restart Apache
alias editHosts='edit /etc/hosts'                       # Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # Grabs headers from web page

# Download a web page and show info on what took time
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Display current Git branch name in command prompt. ###
function parse_git_branch {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}

# new WordPress Installation
new-wp(){
  git clone https://github.com/WordPress/WordPress.git $1
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
SEAFOAM="\[\033[0;34m\]"
NO_COLOR="\[\033[0m\]"
MAGENTA="\[\033[0;31m\]"
GOLD="\[\033[0;32m\]"
BLUE="\[\033[0;33m\]"

export PS1="$NO_COLOR----------------------------------\n$MAGENTA\u$GOLD \W$BLUE\$(parse_git_branch)$SEAFOAM \$$NO_COLOR "


# -- Random Useful Things -- #

# send an imessage
imessage() {
  osascript ~/programs/imessage.scpt $1 $2
}
# Run a screensaver as the desktop background
alias screensaverBackground='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# set iterm tab and window names
set_iterm_name() {
  mode=$1; shift
  echo -ne "\033]$mode;$@\007"
}

nameboth () { set_iterm_name 0 $@; }
nametab () { set_iterm_name 1 $@; }
namewindow () { set_iterm_name 2 $@; }

# cli twitter client
alias twitter='rainbowstream -iot'

# cli reddit client
alias reddit='rtv --enable-media'

# bash completion for the `wp` command
_wp_complete() {
	local OLD_IFS="$IFS"
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

	if [[ "$opts" =~ \<file\>\s* ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	elif [[ $opts = "" ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	else
		COMPREPLY=( ${opts[*]} )
	fi

	IFS="$OLD_IFS"
	return 0
}
complete -o nospace -F _wp_complete wp

# search and download music just by looking up lyrics or any information
alias get-music='instantmusic'

# add a new note to Apple Notes
getnote() { osascript ~/programs/note/get-note.scpt "$1"; }

note() {
  FIRST=$1
  shift
  if [ $FIRST = "get" ]
  then
    getnote "$*"
  else
    osascript ~/programs/note/new-note.scpt "$FIRST" "$*"
  fi
}

# default howdoi command to show more results
#howdoi() {
#  howdoi $* -c -n 5
#}

# thefuck? fixes wrong commands
eval $(thefuck --alias)

# generates gifs from mp4 files
alias mp4togif='gifgen'

# downloads a youtube video
alias youtube='youtube-dl'

# look up and download SoundCloud likes of a user (config file at ~/.nehmconfig)
alias soundcloud='nehm'

# open a new google chrome window
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# empty mail to get rid of annoying messages
empty-mail() { : > /var/mail/$USER ; }
alias delete-mail='empty-mail'

isrunning() {
	SERVICE=$1
	if pgrep -f "$SERVICE" >/dev/null 2>&1 ; then
		echo "true"
	else
		echo "false"
	fi
}

brackets-is-running() {
	BRACKETS_OPEN=$(isrunning Brackets)
	if [ $BRACKETS_OPEN = "true" ]
	then
		terminal-notifier -message "Brackets is open, are you tracking your time?" -title "Check Timers" -execute "null"
	fi
}

# check if brackets is running every 1.5 hours and remind me with a notification
checktimers() {
	while true; do brackets-is-running; sleep 5400; done
}
