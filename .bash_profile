#!/usr/bin/env bash

# Export common Bash init files

for file in ~/.{aliases,bash_prompt,extra,functions,inputrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Workaround for case-insensitive tab completion on macOS

bind "set completion-ignore-case on"

# In order of appearance:

# Autocorrect misspelled directories;
# Check the window size after every command;
# Append to command history rather than overwriting it;
# Ignore character casing

shopt -s cdspell checkwinsize histappend nocaseglob
