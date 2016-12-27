#!/usr/bin/env bash

# Export aliases, prompt, and extras

for file in ~/.{aliases,bash_prompt,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

shopt -s cdspell; # Autocorrect misspelled directories
shopt -s dotglob; # Show files starting with a '.'
shopt -s histappend; # Append command history rather than overwriting it
shopt -s nocaseglob; # Ignore character casing

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
