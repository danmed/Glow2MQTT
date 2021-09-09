#!/bin/bash
consumption=0
since_midnight=$(( $(date "+10#%H * 60 + 10#%M") ))
/root/glow2mqtt/glowmarkt-csv  -u '<USERNAME>' -p '<PASSWORD>' -m $since_midnight -d PT30M -c electricity.consumption -n > consumption.csv
#consumption=`glowmarkt-today -u '<USERNAME>' -p '<PASSWORD>' -c electricity.consumption

while read line
do
   output=${line//$'\r'/}
   consumption=$(bc <<< "$consumption + $output")
done < <(tail -n+1 consumption.csv)
mosquitto_pub -h <MQTT_IP> -m $consumption -t glowmarkt/consumptiontoday -u <MQTT_USER> -P <MQTT_PASS> -r -d
