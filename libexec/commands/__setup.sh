#!/usr/bin/env bash
#
# __setup.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

install_rust() {
  echo "Installing Rust..." | status

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_packages() {
  local packages=(
    direnv
    wget
    curl
  )

  local casks=(
    appzapper
    google-chrome
    slack
    balenaetcher
    insomnia
    meshmixer
    blender
    rar
  )

  echo "Installing packages..." | status

  for package in "${packages[@]}"; do
    echo "Installing ${package}..." | status
    
    brew install $package
  done

  for cask in "${casks[@]}"; do
    echo "Installing ${package}..." | status

    brew install --cask $cask
  done
}

echo "Setting up your machine..." | status

install_rust && install_packages

echo "$(realm init)" >> $HOME/.zshrc