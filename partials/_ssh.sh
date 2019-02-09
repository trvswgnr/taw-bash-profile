##
# Create a new ssh keypair and add to the keychain
###
new-ssh() {
  OPTIND=1 # restart getopts index (otherwise will only take options the first time it's run)
  TYPE="rsa"
  FILENAME="false"
  COMMENT="$USER@$USER.local"
  BITS=4096
  DIRECTORY="~/.ssh"
  NOPASS='true'

  helpmenu() {
    printf "Usage: ${FUNCNAME[0]}
      -f string: Use custom filename (default: id_rsa)
      -c string: (default USER@USER.local)
      -t rsa, dsa, ecdsa: key type (default: rsa)
      -b number: encryption bits (default: 4096)
      -d string: Directory where key will be placed (default: ~/.ssh/)
      -p: show passphrase prompt when creating key
      -h: display this menu"
  }

  while getopts ":f:c:t:b:d:p" opt; do
    case $opt in
      f) FILENAME="$OPTARG";;
      c) COMMENT="$OPTARG";;
      t) TYPE="$OPTARG";;
      b) BITS="$OPTARG";;
      d) DIRECTORY="${OPTARG%/}";;
      p) NOPASS="false";;
      \?) helpmenu; return 1;;
    esac
  done

  # use regular ssh naming convention if nothing is assigned with flag
  if [ $FILENAME = "false" ]; then
    FILENAME="id_$TYPE"
  fi

  # dsa keys must use 1024 bit encryption
  if [ $TYPE = "dsa" ]; then
    BITS=1024
  fi

  if [ $NOPASS = "false" ]; then
    ssh-keygen -t $TYPE -b $BITS -C "$COMMENT" -f ~/.ssh/$FILENAME -q
  else
    ssh-keygen -t $TYPE -b $BITS -C "$COMMENT" -f ~/.ssh/$FILENAME -q -N ""
  fi

  # check for errors, and print success message if none
  if [ $? -eq 0 ]; then
    printf "\nCreated $TYPE keypair at $DIRECTORY/$FILENAME with no passphrase ($BITS encryption)\n"

    if [[ "$OSTYPE" == "darwin"* ]]; then # detect if Mac OS and add to keychain
      printf "\n- Mac Detected -\n"
      ssh-add -K ~/.ssh/$FILENAME
    else # otherwhise regular ssh agent add
      ssh-add ~/.ssh/$FILENAME
    fi
    #
    if [ $? -eq 0 ]; then # check for errors, and print success message if none
      printf "\nSuccessfully created and added keys\n"
    else
      printf "\nError adding $FILENAME key to ssh-agent\n"
    fi
  else
    printf "\nFailed to create/add ssh key\n"; return 1;
  fi
}
