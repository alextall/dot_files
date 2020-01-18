# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


###########
# History #
###########

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#################
# Color Support #
#################

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  	color_prompt=yes
  else
  	color_prompt=
  fi
fi

if [ "$color_prompt" = yes ] && [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
    export PS1='\[\033[01;34m\]\W\[\033[01;32m\]$(__git_ps1 "(%s)")\[\033[00m\]>> '
elif [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
    export PS1='\W$(__git_ps1 "(%s)")>> '
else
    export PS1='\W>> '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Custom colors
if [ -f ${HOME}/.bash_color_aliases ]; then
	source ${HOME}/.bash_color_aliases
fi


##################
# Autocompletion #
##################

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Git autocompletion
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fi

# Homebrew autocompletion
if [ -f $(brew --repository)/Library/Contributions/brew_bash_completion.sh ]; then
  source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
fi

# Carthage autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Github autocompletion
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  source $(brew --prefix)/etc/bash_completion.d
fi

# Z makes cd better
if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
  . `brew --prefix`/etc/profile.d/z.sh
fi

# iTerm3 integration
if [ -f ${HOME}/.iterm2_shell_integration.bash ]; then
  source ${HOME}/.iterm2_shell_integration.bash
fi


#################
# Miscellaneous #
#################

# Custom aliases
if [ -f ${HOME}/.bash_aliases ]; then
    source ${HOME}/.bash_aliases
fi

# Private keys
if [ -f ${HOME}/.bash_keys ]; then
  source ${HOME}/.bash_keys
fi

# Apple CommandLineTools
if [ -d /Library/Developer/CommandLineTools ]; then
    export PATH="/Library/Developer/CommandLineTools:$PATH"
fi

# Swift Environments
if which swiftenv > /dev/null; then
  eval "$(swiftenv init -)"
  export SWIFTENV_ROOT=/usr/local/var/swiftenv
fi

# Ruby Environments
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

export EDITOR=bbedit
export PATH="$PATH:`yarn global bin`"

### Added by the Bluemix CLI
if [ -f /usr/local/Bluemix/bx/bash_autocomplete ]; then
  source /usr/local/Bluemix/bx/bash_autocomplete
fi
