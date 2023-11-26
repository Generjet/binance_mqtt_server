#!/bin/sh

# https://gist.github.com/David-Lor/63fb0be80b67359c8de6230c6b1dafa2

while true  # Keep an infinite loop to reconnect when connection lost/broker unavailable
do
    # mosquitto_sub -h localhost -t zigbee2mqtt/things/\# -F "%t %p" | while read -r payload
    mosquitto_sub -h localhost -t "binanko" -F "%t %p" | while read -r payload
    # mosquitto_sub -h "127.0.0.1" -t "binanko" | while read -r payload
    do
        # Here is the callback to execute whenever you receive a message:
        topic=$(echo "$payload" | cut -d ' ' -f 1)
        msg=$(echo "$payload" | cut -d ' ' -f 2-)
        echo "Rx MQTT: $topic: ${payload}"
        p=$(echo "$msg" | jq '.signal')
        echo "Extracted property: $p for $topic"
    done
    sleep 1  # Wait 10 seconds until reconnection
done # &  # Discomment the & to run in background (but you should rather run THIS script in background)