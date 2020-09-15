# -- FILE AND FOLDER MANAGEMENT -- #

alias mv='mv -iv'        # move a file or folder
alias cp='cp -iv'        # copy a file or folder
alias mkdir='mkdir -pv'  # make a new directory
mcd () { mkdir -p "$1" && cd "$1"; }      # makes new directory and jumps inside

zipf () { zip -r "$1".zip "$1" ; }      # to create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'  # count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'     # creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'     # creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'  # creates a file of 10mb size (all zeros)

# navigate to frontmost window of MacOS Finder
cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

# move a file to the MacOS trash
# trash () { command mv "$@" ~/.Trash ; }
# alias rm='trash'

# open file in MacOS Quicklook Preview
ql () { qlmanage -p "$*" >& /dev/null; }

# extract most know archives with one command
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
    echo "'$1' is not a valid file"
  fi
}

# open current directory in MacOS Finder
alias finder='open -a Finder ./'

# Pipe content to file on MacOS Desktop
alias DT='tee ~/Desktop/terminalOut.txt'

# make an alias (shortcut file)
mkalias() {
  if [ "$2" != "" ]; then
    ln -s "$1" "${2%/}"
  else
    ln -s "$1"
  fi
}
alias symlink="mkalias"

# batch rename filenames in current directory
batch-rename() {
	EXT=${3:-}
	OLD=${1:--h}
	NEW=${2:-}

	# show help if no parameters
	if [ $OLD = "-h" ]; then
		echo "USAGE:"
		echo "batch-rename original replacement(defaults to nothing) extension(defaults to all)"
	else
		for file in *$EXT ; do mv $file ${file//$OLD/$NEW} ; done
	fi
}
