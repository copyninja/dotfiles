#!/bin/bash

# My laptop touch pad won't work without this
synclient TapButton1=1 TapButton2=1 VertEdgeScroll=1 HorizEdgeScroll=1 CornerCoasting=1

# Load resources
xrdb -merge .Xresources

# Remap caps lock
xmodmap ~/.xmodmap

# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
       --expand true --width 10 --transparent true --tint 0x191970 --height 15 &

# Run gpg-agent required by alot
eval $(gpg-agent --daemon --pinentry-program /usr/bin/pinentry-qt4 \
	  --enable-ssh-support)

#feh --bg-scale ~/Pictures/2013/07/07/IMG_20130707_141208.jpg

# Set the background color<
#xsetroot -solid midnightblue

# Fire up apps
emacs --daemon 2>&1 1>/dev/null &
urxvtd -q -o -f &

# Xcompmgr for transparency
# xcompmgr &

#xscreensaver -no-splash &
if [ -x /usr/bin/wicd-client ] ; then
    wicd-client -t &
fi

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 3
   xfce4-power-manager &
fi

#exec /usr/local/bin/xmonad-launch
#exec cwm
