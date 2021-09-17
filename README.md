# Glow2MQTT

This is just a shell script to allow easy scheduling of the pyglowmarkt project by cybermageddon :  https://github.com/cybermaggedon/pyglowmarkt

It will provide (optionally) Electricity and Gas readings and pass them to MQTT. From there you can add them to HomeAssistant and integrate them with the Energy Dashboard. (or whatever else you want to do with the data!

You will need a glowmarkt.com account (free.. no need for their IHD) linked to your provider and receiving readings from your SMETS2 meter. This will only give you the halfhourly increments, but seeing as the energy dashboard in HA only reports hourly figures, it works just fine.

OS : 
ONLY TESTED ON UBUNTU 20.04

DEPENDENCIES : 
* apt install python3-pip
* pip install paho-mqtt
* pip install pyglowmarkt
 
SETUP : 
* timedatectl set-timezone Europe/London # Make sure your timezone is correct
* mkdir glow2mqtt
* cd glow2mqtt
* git clone https://github.com/danmed/Glow2MQTT.git
* edit consumption.sh to input your credentials.
* chmod a+x consumption.sh
* Then run the consumption.sh on a cronjob every... however long you want.. Glow only update every 30 minutes so if you check every 20 you should cover it off pretty well

HA YAML code for MQTT Consumption Sensor : 

```YAML
  - platform: mqtt
    name: glow_energy_today
    state_topic: "glowmarkt/consumptiontoday"
    unit_of_measurement: 'kWh'  
    device_class: energy
    state_class: total_increasing
```

HA YAML code for MQTT Cost Sensor : 

```YAML
  - platform: mqtt
    name: glow_cost_today
    state_topic: "glowmarkt/costtoday"
    unit_of_measurement: '£'  
    value_template: "{{ (value | float | round(2)) }}"
    device_class: energy
    state_class: total_increasing
```
    
![image](https://user-images.githubusercontent.com/3878490/132579305-4641c814-c510-48b5-adb9-2d2fa6a4bfba.png)

![image](https://user-images.githubusercontent.com/3878490/132579214-7fb948ad-1020-4309-ab58-281ed78528db.png)
