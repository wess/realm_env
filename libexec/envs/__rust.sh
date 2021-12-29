#!/usr/bin/env bash
#
# __rust.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

PROJECT_FILE="$(pwd)/Cargo.toml"

source "${SCRIPT_ENVS_DIR}/__direnv.sh"

define RUST_IGNORE <<EOF

### Rust ###
# Generated by Cargo
# will have compiled files and executables
debug/
target/

# Remove Cargo.lock from gitignore if creating an executable, leave it for libraries
# More information here https://doc.rust-lang.org/cargo/guide/cargo-toml-vs-cargo-lock.html
Cargo.lock

# These are backup files generated by rustfmt
**/*.rs.bk

# MSVC Windows builds of rustc generate these, which store debugging information
*.pdb

EOF

GIT_IGNORE="$(pwd)/.gitignore"

if [[ -f "$PROJECT_FILE" ]]; then
  echo "Setting up for Rust development..." | status
  source "${SCRIPT_ENVS_DIR}/__vscode_settings.sh"
  
  if [ ! -f $GIT_IGNORE ]; then
    source ${SCRIPT_ENVS_DIR}/__gitignore.sh
  fi
  
  echo "$RUST_IGNORE" >> "$GIT_IGNORE"
fi



unset PROJECT_FILE
