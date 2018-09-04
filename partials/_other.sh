# -- OTHER -- #

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

# -- Random Useful Things -- #

# new WordPress Installation
new-wp(){
  git clone https://github.com/WordPress/WordPress.git $1
}

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
alias getmusic='instantmusic'

# generates gifs from mp4 files
alias mp4togif='gifgen'

# downloads a youtube video
alias youtube='youtube-dl'

# look up and download SoundCloud likes of a user (config file at ~/.nehmconfig)
alias soundcloud='nehm'

# open a new google chrome window
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# get my fire playlist
alias get-fire="cd && cd Music && scdl -l https://soundcloud.com/justfendz/sets/fire --download-archive archive.txt -c"

# open file in preferred code editor
alias edit='brackets'

# cli twitter client
alias twitter='rainbowstream -iot'

# cli reddit client
alias reddit='rtv --enable-media'

# default web browser
alias web='w3m'

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
