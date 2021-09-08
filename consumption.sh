#!/bin/bash

since_midnight=$(( $(date "+10#%H * 60 + 10#%M") ))
/root/glow2mqtt/glowmarkt-csv  -u '<USERNAME>' -p '<PASSWORD>' -m $since_midnight -d P1W -c electricity.consumption > consumption.csv
while read line
do
   output=${line//$'\n'/}
   consumption=$(expr $consumption + $output)
done < <(tail -n +2 consumption.csv)

mosquitto_pub -h <MQTT IP> -m $consumption -t glowmarkt/consumptiontoday -u <MQTT_USER> -P <MQTT_PASS> -r -d
