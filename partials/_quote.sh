# display a quote on open
q() {
q=$(quote)
echo $q
while true; do
  read -p $'\e[36mSave this quote?\e[0m [y/n]: ' yn
  case $yn in
    [Yy]* ) echo '"'$q'"' >> ~/quotes.csv; break;;
    [Nn]* ) return 1;;
    * ) echo '"'$q'"' >> ~/quotes.csv && echo "Quote saved to ~/quotes.csv!" && return 1;;
  esac
done
}
