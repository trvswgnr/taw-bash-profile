# -- FILE AND FOLDER MANAGEMENT -- #

alias mv='mv -iv'        # move a file or folder
alias cp='cp -iv'        # copy a file or folder
alias mkdir='mkdir -pv'  # make a new directory
mcd () { mkdir -p "$1" && cd "$1"; }  # makes new directory and jumps inside

alias numFiles='echo $(ls -1 | wc -l)'  # count of non-hidden files in current dir

# create files
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'

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
    ln -s "$1" "$2"
  else
    ln -s "$1"
  fi
}

# delete .DS_Store files
alias deleteDS="find . -type f -name '*.DS_Store' -ls -delete"
