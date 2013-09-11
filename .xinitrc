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

xset b off s off dpms 0 0 600
xautolock -time 15 -locker 'i3lock -i ~/.theme/wallpaper-1600x900.png -c 222222' &
unclutter -idle 5 &

nvidia-settings -l
compton --backend glx --vsync opengl-swc --glx-no-rebind-pixmap --glx-copy-from-front -c -G -o 0.5 -C -b

dunst &

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export PATH=~/projects/i3:~/project/i3-bar:$PATH
exec i3 -V >> /tmp/i3.log 2>&1
