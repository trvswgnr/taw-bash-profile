# -- SYSTEMS OPERATIONS & INFORMATION -- #
 
# mount for use when booted into single-user
alias mountReadWrite='/sbin/mount -uw /' 
 
# Recursively delete .DS_Store files
alias deleteDS="find . -type f -name '*.DS_Store' -ls -delete"
 
# Show & Hide hidden files in Finder
alias showHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias hideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
 
# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
