#!/bin/bash
####CONFIG#####
glowuser="<CHANGEME>"
glowpass="<CHANGEME>"
mqttip="<CHANGEME>"
mqtttopic_consumption="glowmarkt/consumptiontoday"
mqtttopic_cost="glowmarkt/costtoday"
mqttuser="<CHANGEME>"
mqttpass="<CHANGEME>"
################

####GRAB VALUES FROM DCC####
consumption=`consumption=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c electricity.consumption -t $mqtttopic_consumption --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`
cost=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c electricity.consumption.cost -t $mqtttopic_cost --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`
