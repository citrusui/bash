#!/usr/bin/env bash

function checkTools() {
  if [ ! "$(which git)" ]; then
    echo "Git is required."
    echo "Please install it from https://git-scm.com or your package manager."
    echo "If you are on macOS, run xcode-select --install."
    sleep 5;
    exit 1;
  fi
}

function pullSource() {
  rsync --exclude ".git" --exclude "*.yml" --exclude "*.md" --exclude "*.sh" -avh --no-perms . ~;
  source ~/.bashrc
}

checkTools

cd "$(dirname "${BASH_SOURCE}")";
echo ""
echo "Pulling updates..."
echo ""
git pull origin master;
if [ "$1" == "-y" ]; then
  pullSource
else
  echo ""
  read -p "This may overwrite your existing preferences. Continue? [y/N] " REPLY
  echo ""
  if [[ "$REPLY" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    pullSource
  else
    echo "Aborted."
  fi
fi
