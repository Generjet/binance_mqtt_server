import paho.mqtt.client as mqtt

# The callback when the client receives a CONNACK response from the server
def on_connect(client, userdata, flags, rc):
    print("Connected with result code"+str(rc))
    #Subscribing in on_connect() means that if we lose the connection and reconnect then subscription will be renewed.
    client.subscribe("binanko")

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("localhost", 1883, 60)

#Blocking call that processes network traffic, dispatches callbacks and handles econnecting.
# Other loop*() functions are available that gives a threaded interface and a manual interface.
client.loop_forever()
