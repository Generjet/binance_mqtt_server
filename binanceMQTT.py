import paho.mqtt.client as mqtt

# The callback when the client receives a CONNACK response from the server
def on_connect(client, userdata, flags, rc):
    print("Connected with result code"+str(rc))
    #Subscribing in on_connect() means that if we lose the connection and reconnect then subscription will be renewed.
    client.subscribe("binanko")

def on_message(client, userdata, msg):
    print("payload: "+str(msg.payload) +" topic: "+str(msg.topic)+ "with QoS " + str(msg.qos ))


client = mqtt.Client()
# client = mqtt.Client("Automated_Home_instance1") #create new instance
client.on_connect = on_connect
client.on_message = on_message

client.connect("localhost", 1883, 60)

#Blocking call that processes network traffic, dispatches callbacks and handles econnecting.
# Other loop*() functions are available that gives a threaded interface and a manual interface.
client.loop_forever()
# time.sleep(4) # wait
# client.loop_stop() #stop the loop