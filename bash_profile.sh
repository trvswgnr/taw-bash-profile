# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

source ~/bash_profile/partials/_base.sh
source ~/bash_profile/partials/_general.sh
source ~/bash_profile/partials/_git.sh
source ~/bash_profile/partials/_files.sh
source ~/bash_profile/partials/_search.sh
source ~/bash_profile/partials/_network.sh
source ~/bash_profile/partials/_other.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# if command fortune >/dev/null; then fortune oblique; fi

