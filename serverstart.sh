#!/bin/bash
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export AG_AUTH_TOKEN=$authtoken
if [ ! -e "/opt/data/CONTAINER_ALREADY_STARTED_PLACEHOLDER" ]; then
	echo "***Downloading Path of Titans Server"
	wget https://launcher-cdn.alderongames.com/AlderonGamesCmd-Linux-x64
	chmod +x /opt/data/ -R
    ./AlderonGamesCmd-Linux-x64 --game path-of-titans --server true --beta-branch $branch --install-dir ./ --username $username --password $password
	touch /opt/data/CONTAINER_ALREADY_STARTED_PLACEHOLDER
fi

chmod 777 /opt/data/ -R
echo "***Starting Path of Titans Server"
su potserver -c "/opt/data/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping -Port=$port -BranchKey=$branch -log -Username=$username -Password=$password -ServerGUID=$guid -Database=$database $additionalcommands" &

term_handler(){
	echo "***Stopping"
	pkill --signal 2 --echo PathOfTitans
	while pgrep PathOfTitans; do
		sleep 2
	done
	exit 0
}
trap 'term_handler' SIGTERM
while true
do
	tail -f /dev/null & wait ${!}
done
exit