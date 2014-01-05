# My laptop touch pad won't work without this
synclient TapButton1=1 TapButton2=1 VertEdgeScroll=1 HorizEdgeScroll=1 CornerCoasting=1

# Default  I use xfce4
DEFAULT_SESSION=/usr/bin/dwm-launch

# I can't run ssh-add otherwise
eval `ssh-agent`
export SSH_ASKPASS=/usr/bin/ssh-askpass

# Run gpg-agent required by alot
eval $(gpg-agent --daemon --pinentry-program /usr/bin/pinentry-qt4)


case $1 in
kde)
	    exec dbus-launch startkde
	;;
xfce4)
	    exec dbus-launch startxfce4
	;;
dwm)
    	    exec dbus-launch --sh-syntax --exit-with-session /usr/bin/dwm-launch
	;;
wmii)
        feh --bg-scale /home/vasudev/Documents/personal_hacks/wallpapers/UNIX4.png
        volumeicon &
        xfce4-power-manager
        xscreensaver -no-splash &
        exec dbus-launch wmii
	
	;;
awesome)
        volumeicon &
        xfce4-power-manager
        xscreensaver -no-splash &
        exec dbus-launch awesome
        
	;;
blackbox)
	exec dbus-launch blackbox
	;;
stumpwm)
	xfce4-power-manager&
	exec dbus-launch stumpwm
	;;
*)
	#exec ck-launch-session dbus-launch $DEFAULT_SESSION
        exec dbus-launch --sh-syntax --exit-with-session /usr/bin/dwm-launch
	#exec dbus-launch startxfce4
	;;
esac
