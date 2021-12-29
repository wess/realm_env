#!/usr/bin/env zsh
#
# __vscode_settings.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

export REALM_AUTHOR="wess"
export REALM_NAME="wess"
export REALM_EMAIL="me@wess.io"
export REALM_COMPANY="Wess.io"
export REALM_EDITOR="vim"

PROJECT=${PWD##*/}

define PSI_CONFIG <<EOF
{
  "psi-header.variables": [
    ["projectname", "$PROJECT"],
    ["author", "$REALM_AUTHOR"],
    ["authoremail", "$REALM_EMAIL"],
    ["company", "$REALM_COMPANY"]
  ]
}
EOF

OUT_DIR="$(pwd)/.vscode/settings.json"

if [ ! -f $OUT_DIR ]; then
  mkdir -p "$(dirname "$OUT_DIR")" && touch "$OUT_DIR"
  echo "$PSI_CONFIG" >> $OUT_DIR
fi

unset PSI_CONFIG
unset OUT_DIR