#!/usr/bin/env bash

# Export common Bash init files

for file in ~/.{aliases,extra,functions,inputrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Check if the current shell is interactive
# This prevents a warning message from appearing on login complaining about $TERM not being set

if [[ $- == *i* ]]; then
  source ~/.bash_prompt
fi

# In order of appearance:

# Autocorrect misspelled directories;
# Check the window size after every command;
# Append to command history rather than overwriting it;
# Ignore character casing

shopt -s cdspell checkwinsize histappend nocaseglob

# Enable bash Tab completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
