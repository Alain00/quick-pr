#!/bin/bash
QPR_INSTALL_FOLDER=$HOME/.sh-quick-pr
SCRIPT_FILE=$QPR_INSTALL_FOLDER/sh-quick-pr.sh

if ! command -v gh > /dev/null; then
  if ! echo "$OSTYPE" | grep "linux" -q; then
    read -p "You don't have gh cli installed, do want to intall it now (y/n)? " ANS
    if [ "$ANS" != "${ANS#[Yy]}" ]; then
      curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
      sudo apt update
      sudo apt install gh
    else
      echo "🙄 Ok, just remember to install it later"
    fi
  else
    echo "🚨 Remember to install gh cli in order to use this tool"
  fi
fi

if [ ! -d $QPR_INSTALL_FOLDER ]; then
  git clone git@github.com:Alain00/sh-quick-pr.git $QPR_INSTALL_FOLDER
else
  echo "♻️  using existing installation in $QPR_INSTALL_FOLDER"
fi

INSTALL_LINE=". ${SCRIPT_FILE}"
BASH_CONFIG=$HOME/.bashrc

if [ -f $HOME/.zshrc ]; then
  INSTALL_LINE="source ${SCRIPT_FILE}"
  BASH_CONFIG=$HOME/.zshrc
fi

if grep -q "${INSTALL_LINE}" $BASH_CONFIG; then
  echo "🎉 quick PR is already installed in $BASH_CONFIG"
else
  echo "\n# sh-quick-pr install (see https://github.com/Alain00/sh-quick-pr)" >> $BASH_CONFIG
  echo "export QPR_INSTALL_FOLDER=${QPR_INSTALL_FOLDER}" >> $BASH_CONFIG
  echo $INSTALL_LINE >> $BASH_CONFIG
  echo "🥳 quick PR installed in $BASH_CONFIG"
fi