require 'mqtt'

# Publish example
MQTT::Client.connect('localhost') do |c|
  c.publish('test', 'message')
end

# Subscribe example
MQTT::Client.connect('localhost') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('test/signal') do |topic,message|
    puts "#{topic}: #{message}"
    puts "SIGNAL is: #{message}"
  end
end