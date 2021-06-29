#!/bin/sh
LEAF1="http://leaf1-networkpolicy-leaf1.apps.ocp4.lab.unixnerd.org"
while : 
do
        echo "Calling leaf1 directly:" 
        curl --max-time 0.3 $LEAF1/leaf1
	echo ""
        echo "Calling foo:" 
        curl --max-time 0.3 $LEAF1/callfoo
	echo ""
        echo "Calling leaf2 from leaf1:" 
        curl --max-time 0.3 $LEAF1/callleaf2
	echo ""
	sleep 2
done
