#!/bin/sh
LEAF1="http://leaf1-networkpolicy-leaf1.apps.ocp4.lab.unixnerd.org"
while : 
do
	sleep 0.5
        echo "Calling leaf1 directly:" 
        curl --max-time 0.3 $LEAF1/leaf1
	echo ""
done
