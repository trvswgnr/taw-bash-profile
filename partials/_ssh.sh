# create a new ssh keypair and add to the keychain
new-ssh() {
  OPTIND=1 # restart getopts index (otherwise will only take options the first time it's run)
  TYPE="rsa"
  FILENAME="false"
  COMMENT="$USER@$USER.local"
  BITS=4096
  NOPASS='true'

  helpmenu() {
    printf "Usage: new-ssh
      -f: filename (default: id_rsa)
      -c: comment (default USER@USER.local)
      -t: key type (default: rsa)
      -b: encryption bits (default: 4096)
      -p: show passphrase prompt when creating key
      -h: shows this menu"
  }

  while getopts ":f:c:t:b:p" opt; do
    case $opt in
      f) FILENAME="$OPTARG";;
      c) COMMENT="$OPTARG";;
      t) TYPE="$OPTARG";;
      b) BITS="$OPTARG";;
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
    ssh-keygen -t $TYPE -b $BITS -C "$COMMENT" -f ~/.ssh/$FILENAME
  else
    ssh-keygen -t $TYPE -b $BITS -C "$COMMENT" -f ~/.ssh/$FILENAME -q -N ""
  fi

  # check for errors, and print success message if none
  if [ $? -eq 0 ]; then
    printf "\nSuccessfully created $TYPE keypair at ~/.ssh/$FILENAME with no passphrase ($BITS encryption)"

    if [[ "$OSTYPE" == "darwin"* ]]; then # detect if Mac OS and add to keychain
      ssh-add -K ~/.ssh/$FILENAME
    else # otherwhise regular ssh agent add
      ssh-add ~/.ssh/$FILENAME
    fi
    #
    if [ $? -eq 0 ]; then # check for errors, and print success message if none
      printf "\nAdded $FILENAME key to ssh-agent"
    else
      printf "\nError adding $FILENAME key to ssh-agent"
    fi
  else
    printf "\nFailed to create/add ssh keys"; return 1;
  fi
}
