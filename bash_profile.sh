# TAW Bash Profile
# @author: Travis A. Wagner
# @website: http://travisawagner.com

source ~/bash_profile/partials/_base.sh
source ~/bash_profile/partials/_general.sh
source ~/bash_profile/partials/_git.sh
source ~/bash_profile/partials/_files.sh
source ~/bash_profile/partials/_search.sh
source ~/bash_profile/partials/_network.sh
source ~/bash_profile/partials/_processes.sh
source ~/bash_profile/partials/_system-ops.sh
source ~/bash_profile/partials/_other.sh

# add anything workspace-specific here
alias wget="'/c/Program Files (x86)/GnuWin32/bin/wget'"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias docker-linux="winpty docker exec -ti ubuntu bash"
alias docker-restart="cd ~/Code/gtmc/Docker/ && sh docker-restart.sh"
alias portal="cd ~/Code/gtmc/ClientPortal/"
alias go-docker="cd ~/Code/gtmc/Docker"

# display a quote on open
quo() {
q=$(quote)
echo $q
while true; do
  read -p "Save this quote? [y/n]" yn
  case $yn in
    [""]* ) echo '"'$q'"' >> ~/quotes.csv; break;;
    [Yy]* ) echo '"'$q'"' >> ~/quotes.csv; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done
}
quo

# edit the vimrc
alias vimrc="vim ~/.vimrc"
