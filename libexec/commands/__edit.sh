#!/usr/bin/env bash
#
# __edit.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

cmd=$1
shift

STACK_DIR="${SCRIPT_ROOT}/stack"

EDITOR="vim"

if [[ -z $REALM_EDITOR ]]; then
  EDITOR="${REALM_EDITOR}"
fi

case $cmd in
  "alias")
    "${EDITOR} ${STACK_DIR}/alias.sh"
    ;;
  "functions")
    "${EDITOR} ${STACK_DIR}/functions.sh"
    ;;
  "hooks")
    "${EDITOR} ${STACK_DIR}/hooks.sh"
    ;;
  "paths")
    "${EDITOR} ${STACK_DIR}/paths.sh"
    ;;
  *)
    echo "Invalid edit command." | error
    ;;
esac