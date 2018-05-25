# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

source ~/bash_profile/_base.sh
source ~/bash_profile/_general.sh
source ~/bash_profile/_git.sh
source ~/bash_profile/_files.sh
source ~/bash_profile/_search.sh
source ~/bash_profile/_network.sh
source ~/bash_profile/_other.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

