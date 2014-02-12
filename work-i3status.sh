#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error


i3status | while read line; do
	cs_stat=$(wget -q -O - http://localhost:12345/status/port/5000)
	msg='CS (!)'
	if test "X${cs_stat}" == "X"; then
		msg="CS ${cs_stat}"
	fi
	echo "CS: ${cs_stat} | ${line}" || exit 1
done


