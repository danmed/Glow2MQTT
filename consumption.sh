#!/bin/bash

dt=$(date '+%d/%m/%Y %H:%M:%S');
dtfile=$(date '+%d-%m-%Y');

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

###OPTIONAL LOGGING OF DATA###
### If you un hash the below lines it will create dated csv files in a directory called output###
### Change paths as required###
###GATHER###
#elec_consumption=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption`
#elec_cost=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c electricity.consumption.cost`
#gas_consumption=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c gas.consumption`
#gas_cost=`/usr/local/bin/glowmarkt-today -u $glowuser -p $glowpass -c gas.consumption.cost`

###LOG##
#echo $dt $elec_consumption >> /root/glow2mqtt/output/$dtfile-elec_consumption.csv
#echo $dt $elec_cost >> /root/glow2mqtt/output/$dtfile-elec_cost.csv
#echo $dt $gas_consumption >> /root/glow2mqtt/output/$dtfile-gas_consumption.csv
#echo $dt $gas_cost >> /root/glow2mqtt/output/$dtfile-gas_cost.csv

