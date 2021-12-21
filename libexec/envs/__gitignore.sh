#!/usr/bin/env bash
#
# __gitignore.sh
# realm
# 
# Author: Wess Cope (me@wess.io)
# Created: 12/21/2021
# 
# Copywrite (c) 2021 Wess.io
#

define GIT_IGNORE <<EOF
#### Generated by Realm
### macOS ###
# General
.DS_Store
.AppleDouble
.LSOverride
# Icon must end with two \r
Icon
# Thumbnails
._*
# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent
# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
### VisualStudioCode ###
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
*.code-workspace
### VisualStudioCode Patch ###
# Ignore all local history of files
.history
.ionide

EOF

OUT_DIR="$(pwd)/.gitignore"

if [ ! -f $OUT_DIR ]; then
  echo "$GIT_IGNORE" >> $OUT_DIR
fi