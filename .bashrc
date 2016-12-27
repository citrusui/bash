#!/usr/bin/env bash

[ -n "$PS1" ] && source ~/.bash_profile; # Check if we are interactive

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
