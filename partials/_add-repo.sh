addrepo() {
  set -e

  EXISTING_NAME=$(git config user.name)

  # prompt user to use existing github username
  read -p "is your GitHub username $EXISTING_NAME? (y/n): " IS_USING_EXISTING

  # check if user chose yes to previous question
  if [ "$IS_USING_EXISTING" = "y" ] || [ "$IS_USING_EXISTING" = "" ]
  then
    GIT_USERNAME=$EXISTING_NAME
    echo "github username: $GIT_USERNAME"
  else
    read -p "github username: " GIT_USERNAME
  fi

  # prompts for project info
  read -p "project name: " PROJECT_NAME
  read -p "project description: " PROJECT_DESCRIPTION

  # wrap the variables in quotes for the JSON
  WRAPPED_NAME='"'$PROJECT_NAME'"'
  WRAPPED_DESCRIPTION='"'$PROJECT_DESCRIPTION'"'

  # the JSON for the github curl command
  JSON='{"name":'$WRAPPED_NAME',"description":'$WRAPPED_DESCRIPTION'}'
  curl -u $GIT_USERNAME https://api.github.com/user/repos -d $JSON

  read -p "add remote and push? (y/n): " IS_ADDING

  if [[ $IS_ADDING = "y" ]] || [[ $IS_ADDING = "" ]]
  then
    git remote add origin https://github.com/$GIT_USERNAME/$PROJECT_NAME.git
    git push --porcelain --progress origin master
    echo "added and pushed"
  else
    echo "complete"
  fi
}
