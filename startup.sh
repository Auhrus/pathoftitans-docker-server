#!/bin/bash
./potstart.sh &
term_handler(){
   echo "***Stopping"
   pkill --signal 2 --echo --uid 1000
   wait
   exit $?
}
trap 'term_handler' SIGTERM
while true
do
   #sleep 1000 - Doesn't work with sleep. Not sure why.
   tail -f /dev/null & wait ${!}
done