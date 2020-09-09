# -- BASE -- #

# Set default blocksize for ls, df, du
# http://hints.macworld.com/comment.php?mode=view&cid=24491
export BLOCKSIZE=1k

# add Homebrew, Go, and MAMP packages at start of path
export PATH="~/go/bin/:/usr/local/Cellar/:/usr/local/opt/python/libexec/bin:$PATH"

# use the PHP version that's being used in MAMP
PHPVER=$(/usr/libexec/PlistBuddy -c "print phpVersion" ~/Library/Preferences/de.appsolute.mamppro.plist)
export PATH="/Applications/MAMP/bin/php/php${PHPVER}/bin:$PATH"

export PATH="/Applications/MAMP/Library/bin:$PATH"

export PATH="/Users/trav/Library/Python/3.7/bin:$PATH"

export PATH="/Users/trav/miniconda/bin:$PATH"

# set default editor
export EDITOR="code-insiders"
