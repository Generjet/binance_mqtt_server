#!/bin/bash

# This script subscribes to a MQTT topic using mosquitto_sub.
# On each message received, you can execute whatever you want.

while true  # Keep an infinite loop to reconnect when connection lost/broker unavailable
do
    mosquitto_sub -h "127.0.0.1" -t "binanko" | while read -r payload
    do
        # Here is the callback to execute whenever you receive a message:
        echo "Rx MQTT: ${payload}"
    done
    sleep 3  # Wait 10 seconds until reconnection
done # &  # Discomment the & to run in background (but you should rather run THIS script in background)