#!/bin/bash
#declare -i consumption
#declare -i output
since_midnight=$(( $(date "+10#%H * 60 + 10#%M") ))
/root/glow2mqtt/glowmarkt-csv  -u '<USERNAME>' -p '<PASSWORD>' -m $since_midnight -d P1W -c electricity.consumption > consumption.csv
while read line
do
   output=${line//$'\n'/}
   consumption=$(expr $consumption + $output)
done < <(tail -n +2 consumption.csv)

mosquitto_pub -h 192.168.2.15 -m $consumption -t glowmarkt/consumptiontoday -u mqtt2 -P mqtt2 -r -d
