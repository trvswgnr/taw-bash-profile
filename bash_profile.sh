source ~/.profile
# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

source ~/bash_profile/partials/_base.sh
source ~/bash_profile/partials/_path.sh
source ~/bash_profile/partials/_general.sh
source ~/bash_profile/partials/_git.sh
source ~/bash_profile/partials/_files.sh
source ~/bash_profile/partials/_search.sh
source ~/bash_profile/partials/_network.sh
source ~/bash_profile/partials/_other.sh
source ~/bash_profile/partials/_processes.sh
source ~/bash_profile/partials/_system-ops.sh
source ~/bash_profile/partials/_quote.sh
source ~/bash_profile/partials/_ssh.sh
source ~/bash_profile/partials/_clients.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# if command fortune >/dev/null; then fortune oblique; fi

# PM functions
source ~/.pm/pm.bash
alias pma="pm add"
alias pmg="pm go"
alias pmrm="pm remove"
alias pml="pm list"
# end PM
#. "/Users/trav/.acme.sh/acme.sh.env"
