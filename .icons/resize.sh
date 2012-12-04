#!/bin/sh -e

rm -rf hicolor

mkdir -p hicolor/16x16/apps
mkdir -p hicolor/16x16/status
mkdir -p hicolor/22x22/apps

cp /usr/share/pixmaps/pidgin/tray/hicolor/16x16/status/pidgin-*	hicolor/16x16/status

cp /usr/share/icons/hicolor/16x16/apps/nm-*			hicolor/16x16/apps
cp /usr/share/icons/hicolor/22x22/apps/nm-*			hicolor/22x22/apps

# XXX ?!
rm hicolor/22x22/apps/nm-signal-*

DESIRED_SIZE=12x12

find . -name *.png -exec convert {} -adaptive-resize $DESIRED_SIZE {} \;
