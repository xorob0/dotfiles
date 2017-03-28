#!/bin/bash
				mmpd_check="$(mpc status 2>/dev/null | awk 'BEGIN {STATUS=0;INFO=0} !/^volume/ {match($0, /^(\w+.*)/, p); match($0, /(\[playing\]|\[paused\])/, m); if(m[0]!=""){STATUS=m[1]}; if(p[0]!=""){INFO=p[0]}} END {if(STATUS!=0){if(STATUS=="[paused]"){print "mpd: paused"} else {print INFO}} else {print "none"}}')"

				printf "%s%s\n" "MMP" "${mmpd_check}" > /tmp/i3_lemonbar_xorob0
