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

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

nvidia-settings ---load-config-only
nvidia-settings -a InitialPixmapPlacement=2

feh --bg-scale ~/.theme/wallpaper.jpg

xset -b
xautolock -time 5 -locker 'i3lock -i ~/.theme/wallpaper-1600x900.png -c 222222' &
unclutter -idle 15 -jitter 15 &
dcompmgr --gl --no-fade &

exec i3 -V > /tmp/i3.log 2>&1
#exec ~/projects/i3/i3 -V > /tmp/i3.log 2>&1
