#!/bin/bash
####CONFIG#####
glowuser="<CHANGEME>"
glowpass="<CHANGEME>"
mqttip="<CHANGEME>"
mqtttopic_elec_consumption="glowmarkt/elecconsumptiontoday"
mqtttopic_elec_cost="glowmarkt/eleccosttoday"
mqtttopic_gas_consumption="glowmarkt/gasconsumptiontoday"
mqtttopic_gas_cost="glowmarkt/gascosttoday"
mqttuser="<CHANGEME>"
mqttpass="<CHANGEME>"
################

#IF YOU DONT HAVE / WANT GAS THEN HASH OUT THE GAS SECTION

####ELECTRIC####
consumption=`consumption=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c electricity.consumption -t $mqtttopic_elec_consumption --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`
cost=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c electricity.consumption.cost -t $mqtttopic_elec_cost --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`

####GAS####
consumption=`consumption=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c gas.consumption -t $mqtttopic_gas_consumption --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`
cost=`/usr/local/bin/glowmarkt-mqtt -u $glowuser -p $glowpass -c gas.consumption.cost -t $mqtttopic_gas_cost --host $mqttip --mqtt-username $mqttuser --mqtt-pass $mqttpass`
