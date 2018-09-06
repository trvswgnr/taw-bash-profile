 # -- GIT -- #
source ~/bash_profile/partials/_add-repo.sh

alias git-change='git checkout'
alias cbranch='git checkout'
alias st="git status"
alias checkout='git checkout'
alias status='git status'
alias gti='git'
alias gitt='git'
gcaa() { git add --all && git commit -m "$*" ; } # add and commit all files

commit() { git commit -m "$*"  ; }
acommit() { git add $1 && git commit -m "${*:2}" ; }
