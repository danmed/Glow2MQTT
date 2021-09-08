# Glow2MQTT

Note : This is all made possible by this project : https://github.com/cybermaggedon/pyglowmarkt All credit belongs with them!

* Ubuntu 2.04
* timedatectl set-timezone Europe/London
* mkdir glow2mqtt
* cd glow2mqtt
* apt install python3-pip
* pip install pyglowmarkt
* wget https://raw.githubusercontent.com/danmed/Glow2MQTT/main/glowmarkt-csv
* chmod a+x glowmarkt-csv
* apt install mosquitto-clients
* wget https://raw.githubusercontent.com/danmed/Glow2MQTT/main/consumption.sh
* chmod a+x consumption.sh


Then run the consumption.sh on a cronjob every... however long you want.. Glow only update every 30 minutes so if you check every 20 you should cover it off pretty well
