# -- OTHER -- #

# adds MongoDB to the PATH (user specific)
export PATH=/Users/travis/mongodb-osx-x86_64-3.2.6/bin:$PATH


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

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
SEAFOAM="\[\033[0;34m\]"
NO_COLOR="\[\033[0m\]"
MAGENTA="\[\033[0;31m\]"
GOLD="\[\033[0;32m\]"
BLUE="\[\033[0;33m\]"

export PS1="$NO_COLOR-------------------------------------------------------------------\n$MAGENTA\u$GOLD \W$BLUE\$(parse_git_branch)$SEAFOAM \$$NO_COLOR "


# -- Random Useful Things -- #

# Run a screensaver as the desktop background
alias screensaverBackground='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'


# -- REMINDERS & NOTES -- #
 
#   remove_disk: spin down unneeded disk
#   diskutil eject /dev/disk1s3
 
#   # change the password on an encrypted disk image:
#   hdiutil chpass /path/to/the/diskimage
 
#   # mount a read-only disk image as read-write:
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify
 
#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo
 
#   create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat