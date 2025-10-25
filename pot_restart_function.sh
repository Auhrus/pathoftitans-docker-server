#!/bin/bash
while true; do
	sleep 10
	while pgrep -x PathOfTitansSer >/dev/null; do
		sleep 10
	done
	echo "***Restarting Server"
	su potserver -c "/opt/data/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping -Port=$port -BranchKey=$branch -log -Username=$username -Password=$password -ServerGUID=$guid -Database=$database $additionalcommands" &
done