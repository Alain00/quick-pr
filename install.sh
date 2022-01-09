QPR_INSTALL_FOLDER=$HOME/.sh-quick-pr
SCRIPT_FILE=$QPR_INSTALL_FOLDER/sh-quick-pr.sh

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
  echo "Please restart the shell to use the command"
fi