#!/bin/bash

# exit on errors
set -e

# navigate up one directory
cd ..

# move this folder to the home folder and rename
mv ./taw-bash-profile/ ~/bash_profile

# move the bash profile to the home folder and rename
ln -s ~/bash_profile/bash_profile.sh ~/.bash_profile

# colors to make the console prettier
GOLD='\033[0;32m'
BLUE='\033[0;33m'
WHITE='\033[0m'

printf "\n.......${BLUE}success!\n\n"

printf "${GOLD}bash_profile ${WHITE}moved to ${GOLD}$HOME ${WHITE}and renamed ${GOLD}.bash_profile ${WHITE}(hidden file).\n\n"

printf "${GOLD}/taw-bash-profile/ ${WHITE}folder renamed and moved to ${GOLD}$HOME/bash_profile${WHITE}. \n"
