# Glow2MQTT

Note : This is all made possible by this project : https://github.com/cybermaggedon/pyglowmarkt All credit belongs with them!

You will need a glowmarkt.com account linked to your provider and receiving readings from your SMETS2 meter.

* Ubuntu 20.04 # Only version this has been tested on
* timedatectl set-timezone Europe/London # Make sure your timezone is correct
* mkdir glow2mqtt
* cd glow2mqtt
* apt install python3-pip
* pip install pyglowmarkt
* wget https://raw.githubusercontent.com/danmed/Glow2MQTT/main/glowmarkt-csv # This is a slightly modified version of cybermaggedon's script to remove columns no required.
* chmod a+x glowmarkt-csv
* apt install mosquitto-clients
* wget https://raw.githubusercontent.com/danmed/Glow2MQTT/main/consumption.sh
* chmod a+x consumption.sh


Then run the consumption.sh on a cronjob every... however long you want.. Glow only update every 30 minutes so if you check every 20 you should cover it off pretty well
