#
# functions.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

echo "Loading functions..."

mkcd() {
  mkdir -p $1 && cd $1
}

mkth() {
      for p in "$@"; do
        _dir="$(dirname -- "$p")"
        [ -d "$_dir" ] || mkdir -p -- "$_dir"
    touch -- "$p"
    done
}

mkcode() {
  mkdir -p $1 && code $1
}

updateall() {
  brew update && brew upgrade && flutter upgrade
}

