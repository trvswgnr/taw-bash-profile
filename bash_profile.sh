# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

set -o noclobber
source ~/bash_profile/partials/_base.sh
source ~/bash_profile/partials/_general.sh
source ~/bash_profile/partials/_git.sh
source ~/bash_profile/partials/_files.sh
source ~/bash_profile/partials/_search.sh
source ~/bash_profile/partials/_network.sh
source ~/bash_profile/partials/_other.sh
source ~/bash_profile/partials/_processes.sh
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# if command fortune >/dev/null; then fortune oblique; fi
alias wget="'/c/Program Files (x86)/GnuWin32/bin/wget'"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias docker-linux="winpty docker exec -ti ubuntu bash"
alias docker-restart="cd ~/Code/gtmc/Docker/ && sh docker-restart.sh"
alias portal="cd ~/Code/gtmc/ClientPortal/"
alias go-docker="cd ~/Code/gtmc/Docker"
