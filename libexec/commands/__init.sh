#!/usr/bin/env bash
#
# __init.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

echo "Loading Realm..."

export LANG="en_US.UTF-8"

STACK_DIR="${REALM_HOME}/libexec/stack"

system() {
  source "${STACK_DIR}/paths.sh"
  source "${STACK_DIR}/alias.sh"
  source "${STACK_DIR}/hooks.sh"
  source "${STACK_DIR}/functions.sh"

  realm check

  if [[ -f "$REALM_HOME/config.sh" ]]; then
    source "$REALM_HOME/config.sh"
  fi
}

arg=$1
shift

case $arg in
  "flutter")
    source "${SCRIPT_ENVS_DIR}/__flutter.sh"
    ;;
  "node")
    source "${SCRIPT_ENVS_DIR}/__node.sh"
    ;;
  "rust")
    source "${SCRIPT_ENVS_DIR}/__rust.sh"
    ;;
  *)
    system
    ;;
esac

