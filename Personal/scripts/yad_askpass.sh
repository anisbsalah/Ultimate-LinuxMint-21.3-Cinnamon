#!/bin/bash

yad --center --width=350 --height=80 --window-icon="dialog-password-panel" --title="Authenticate" \
	--form --field='Password :':H \
	--button='OK!gtk-ok:0' \
	--button='Cancel!gtk-cancel:1' | sed 's/|//g'
