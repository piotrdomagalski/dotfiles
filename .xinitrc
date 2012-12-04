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
xbindkeys

feh --bg-scale ~/.theme/wallpaper.jpg

#compton -c -l -5 -t -5 -r 5 -o 0.3 -C -G -b

xset b off s off dpms 0 0 300
xautolock -time 15 -locker 'i3lock -i ~/.theme/wallpaper-1600x900.png -c 222222' &
#unclutter -idle 3 &

nvidia-settings -l

dunst &

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

#ulimit -c unlimited

export PATH=~/projects/i3:~/projects/i3/i3bar:$PATH
exec i3 -V >> /tmp/i3.log 2>&1
