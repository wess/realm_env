#!/usr/bin/env bash
#
# __config.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

realm check

if [[ -f "$REALM_CONFIG" ]]; then
  source "$REALM_CONFIG"
fi

AUTHOR="${REALM_AUTHOR}"
NAME="${REALM_NAME}"
EMAIL="${REALM_EMAIL}"
COMPANY="${REALM_COMPANY}"
EDITOR="${REALM_EDITOR}"

exports=(
"export REALM_AUTHOR=\"$AUTHOR\""
"export REALM_NAME=\"$NAME\""
"export REALM_EMAIL=\"$EMAIL\""
"export REALM_COMPANY=\"$COMPANY\""
"export REALM_EDITOR=\"$EDITOR\""
)

write_config() {
  echo "Writing config..." | status

  mkdir -p "${REALM_HOME}"
  echo "#!/usr/bin/env bash" > "${REALM_CONFIG}"

  for e in "${exports[@]}"; do
    echo "$e" >> "${REALM_CONFIG}"

  done
}

set_var() {
  local var="$1"
  local value="$2"

  exports+=("export ${var}=\"${value}\"")

  source "$REALM_CONFIG"
}

del_var() {
  local var="$1"

  for i in "${!exports[@]}"; do
    if [[ "${exports[$i]}" == "export ${var}=\"${!var}\"" ]]; then
      unset exports[$i]
    fi
  done
}

dump_config() {
  CFG=$(cat "${REALM_CONFIG}")

  CONFIGS=($CFG)

  for e in "${#CONFIGS[@]}"; do
    echo "$e"
  done
}

action=$1
shift

case $action in
  "set")
    set_var "$1" "$2"
    write_config
    ;;
  "del")
    del_var "$1"
    write_config
    ;;
  *)
    dump_config
    ;;
esac