# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
setopt autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/szalik/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color'
alias l='ls'

eval `dircolors ~/.dircolors`

export PATH=$PATH:$HOME/bin

export EDITOR=vim
export TERMINAL=gnome-terminal
export BROWSER=chromium

if [ "$COLORTERM" = "gnome-terminal" -a -z "$TMUX" ]; then
	export TERM=xterm-256color
fi

# Skype needs this
export GTK2_RC_FILES="/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0"

export VITRALL_CMAKE_COLORS=1
alias clangcmake="CC='clang -Qunused-arguments -fcolor-diagnostics' CXX='clang++ -Qunused-arguments -fcolor-diagnostics' cmake"

alias vs='cd ~/wrk/vitrall/server'
alias vb='cd ~/wrk/vitrall-build/clang'

alias svim='sudo vim'
alias c='clear'
