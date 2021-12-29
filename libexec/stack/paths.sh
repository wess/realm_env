echo "Loading paths..."

## Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

## Rust
export PATH="${HOME}/.cargo/env:$PATH"
export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib

## Flutter
export PATH="/opt/flutter/bin:$PATH"
