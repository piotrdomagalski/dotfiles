#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap pl
[[ -f ~/.xmodmaprc ]] && xmodmap ~/.xmodmaprc

feh --bg-scale ~/.theme/wallpaper.jpg
#dcompmgr --gl --no-fade &
#cairo-compmgr -n &

xset b off s off dpms 0 0 300
xautolock -time 15 -locker 'i3lock -i ~/.theme/wallpaper-1600x900.png -c 222222' &
#unclutter -idle 15 &

dunst &
#urxvtd -q -f -o

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

nvidia-settings --load-config-only
#nvidia-settings -a InitialPixmapPlacement=0

I3=i3
#I3=~/projects/i3/i3
exec $I3 -V > /tmp/i3.log 2>&1
