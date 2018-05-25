 # -- GIT -- #

source ~/bash_profile/_add-repo.sh

alias git-change='git checkout'
alias cbranch='git checkout'
alias st="git status"
alias commit='git commit'
gcaa() { git add --all && git commit -m "$*" ; } # add and commit all files
