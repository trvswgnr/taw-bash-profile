 # -- GIT -- #

source ~/bash_profile/partials/git/_git-auto-completion.sh
source ~/bash_profile/partials/git/_add-repo.sh

alias git-change='git checkout'
alias cbranch='git checkout'
alias st="git status"
alias commit='git commit'
alias g=git

gcaa() { git add --all && git commit -m "$*" ; } # add and commit all files
git-prune() {
	X=${1:-origin}
	git remote prune $X
	# delete local branches to match remote
	git branch -vv | grep "$X/.*: gone]" | awk '{print $1}' | xargs git branch -d
}
