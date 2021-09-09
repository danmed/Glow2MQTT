#!/bin/bash
consumption=`glowmarkt-today -u '<USERNAME>' -p '<PASSWORD>' -c electricity.consumption`
mosquitto_pub -h <MQTT_IP> -m $consumption -t glowmarkt/consumptiontoday -u <MQTT_USER> -P <MQTT_PASS> -r -d
