#!/bin/sh
LEAF2="http://leaf2-networkpolicy-leaf2.apps.ocp4.lab.unixnerd.org"
while : 
do
        echo "Calling leaf2 directly:" 
        curl --max-time 0.3 $LEAF2/leaf2
	echo ""
        echo "Calling leaf1 from leaf2:" 
        curl --max-time 0.3 $LEAF2/callleaf1
	echo ""
	sleep 2
done
