# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

source ~/bash_profile/partials/_base.sh
source ~/bash_profile/partials/_general.sh
source ~/bash_profile/partials/_git.sh
source ~/bash_profile/partials/_files.sh
source ~/bash_profile/partials/_search.sh
source ~/bash_profile/partials/_network.sh
source ~/bash_profile/partials/_processes.sh
source ~/bash_profile/partials/_other.sh
source ~/bash_profile/partials/_quote.sh

# add anything workspace-specific here
alias wget="'/c/Program Files (x86)/GnuWin32/bin/wget'"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias docker-linux="winpty docker exec -ti ubuntu bash"
alias docker-restart="cd ~/Code/gtmc/Docker/ && sh docker-restart.sh"
alias portal="cd ~/Code/gtmc/ClientPortal/"
alias go-docker="cd ~/Code/gtmc/Docker"

# edit the vimrc
alias vimrc="vim ~/.vimrc"

# set the terminal colors
export TERM=xterm-256color
