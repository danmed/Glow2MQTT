#!/bin/bash
glowuser="<CHANGEME>"
glowpass="<CHANGEME>"
mqttip="<CHANGEME>"
mqttuser="<CHANGEME>"
mqttpass="<CHANGEME>"
consumption=`glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption`
cost=`glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption.cost`
mosquitto_pub -h $mqttip -m $consumption -t glowmarkt/consumptiontoday -u $mqttuser -P $mqttpass -r -d
mosquitto_pub -h $mqttip -m $cost -t glowmarkt/costtoday -u $mqttuser -P $mqttpass -r -d
