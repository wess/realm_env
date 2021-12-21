#!/usr/bin/env bash
#
# __check.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#


if [[ -z "$REALM_DIR" ]]; then
  export REALM_DIR="${SCRIPT_ROOT}"
fi

if [[ -f "$REALM_CONFIG" ]]; then
  source "${REALM_CONFIG}"
else
 source "${SCRIPT_LIBS_DIR}/__config.sh"
fi