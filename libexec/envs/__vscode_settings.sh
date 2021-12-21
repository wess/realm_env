#!/usr/bin/env bash
#
# __vscode_settings.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

define PSI_CONFIG <<EOF
{
  "psi-header.variables": [
    ["projectname", "$PROJECT"],
    ["author", "$AUTHOR"],
    ["authoremail", "$AUTHOR_EMAIL"],
    ["company", "$COMPANY"]
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