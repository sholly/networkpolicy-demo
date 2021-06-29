#!/bin/sh
LEAF1="http://leaf1-networkpolicy-leaf1.apps.ocp4.lab.unixnerd.org"
LEAF2="http://leaf2-networkpolicy-leaf2.apps.ocp4.lab.unixnerd.org"
while : 
do
	sleep 1
        echo "Calling leaf1 directly:" 
        curl $LEAF1/leaf1
        echo "Calling leaf2 from leaf1:" 
        curl $LEAF1/callleaf2
        echo "Calling leaf2 directly:" 
        curl $LEAF2/leaf2
        echo "Calling leaf1 from leaf2:" 
        curl $LEAF2/callleaf1
done
