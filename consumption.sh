#!/bin/bash
####CONFIG#####
glowuser="<CHANGEME>"
glowpass="<CHANGEME>"
mqttip="<CHANGEME>"
mqttuser="<CHANGEME>"
mqttpass="<CHANGEME>"
################

####GRAB VALUES FROM DCC####
consumption=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption`
cost=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption.cost`

####FORMAT COST TO BE IN £####
cost=$(echo "scale=10; $cost/100" | bc -l)

###PUBLISH TO MQTT####
mosquitto_pub -h $mqttip -m $consumption -t glowmarkt/consumptiontoday -u $mqttuser -P $mqttpass -r -d
mosquitto_pub -h $mqttip -m $cost -t glowmarkt/costtoday -u $mqttuser -P $mqttpass -r -d
