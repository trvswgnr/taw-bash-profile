 # -- GIT -- #

source ~/bash_profile/partials/_add-repo.sh

alias git-change='git checkout'
alias cbranch='git checkout'
alias st="git status"
alias commit='git commit'
gcaa() { git add --all && git commit -m "$*" ; } # add and commit all files
git-prune() {
	X=${1:-origin}
	git remote prune $X
	# delete local branches to match remote
	git branch -vv | grep "$X/.*: gone]" | awk '{print $1}' | xargs git branch -d
}
