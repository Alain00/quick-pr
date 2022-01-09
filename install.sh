REPO_FOLDER=~/.sh-quick-pr
SCRIPT_FILE=$REPO_FOLDER/sh-quick-pr.sh

if [ ! -d $REPO_FOLDER ]; then
  git clone git@github.com:Alain00/sh-quick-pr.git $REPO_FOLDER
else
  echo "♻️  using existing installation in $REPO_FOLDER"
fi

INSTALL_LINE="source ${SCRIPT_FILE}"
BASH_CONFIG=~/.bashrc

if grep -q "${INSTALL_LINE}" $BASH_CONFIG; then
  echo "🎉 quick PR is already installed in $BASH_CONFIG"
else
  echo "# sh-quick-pr install (see https://github.com/Alain00/sh-quick-pr)" >> $BASH_CONFIG
  echo "source ${SCRIPT_FILE}" >> $BASH_CONFIG
  echo "🥳 quick PR installed in $BASH_CONFIG"
fi


