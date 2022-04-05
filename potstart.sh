#!/bin/bash
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    echo "Downloading Path of Titans Server"
	wget https://launcher-cdn.alderongames.com/AlderonGamesCmd-Linux-x64
    exec /opt/data/AlderonGamesCmd-Linux-x64 --game path-of-titans --server true --beta-branch $branch --install-dir ./ --username $username --password $password
	touch /opt/data/$CONTAINER_ALREADY_STARTED
	exit 0
else
    chmod 777 /opt/data/ -R
    echo "Starting Path of Titans Server"
    su potserver -c "/opt/data/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping -Port=$port -BranchKey=$branch -log -Username=$username -Password=$password -ServerGUID=$guid -Database=$database"
fi
exit $?