# -- GIT -- #

alias git-change='git checkout'
alias cbranch='git checkout'
alias st="git status"
alias commit='git commit'
gcaa() { git add --all && git commit -m "$*" ; } # add and commit all files

# use custom nano
alias my="PATH=/usr/local/bin:$PATH"
alias nano="my nano"

source ~/bash_profile/_add-repo.sh
