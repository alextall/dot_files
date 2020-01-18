# Import .bashrc
if [ -f ${HOME}/.bashrc ]; then
   source ${HOME}/.bashrc
fi

# MOTD
if [ -f ${HOME}/.motd ]; then
  ${HOME}/.motd
fi
