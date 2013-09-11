# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
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
export TERMINAL=urxvt
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
alias ve='vim ~/.vimrc'
alias m='make'
alias m3='make -j3'

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

export PATH=$HOME/bin:$HOME/bin/i3/bin:$PATH

export CHROMIUM_USER_FLAGS="--password-store=gnome --ignore-gpu-blacklist --ppapi-flash-path=/usr/lib/PepperFlash/libpepflashplayer.so --ppapi-flash-version=11.5.31.101"

alias serve='python -m http.server'
