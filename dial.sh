#!/bin/bash

# Author: Vasudeva Kamath <kamathvasudev@gmail.com>
# License: ISC
# A cyclic wvdial connector script for automatic reconnection
# on connection drop

while true;
do
	if ! `pgrep wvdial`
	then
		wvdial bsnl
	fi
done
