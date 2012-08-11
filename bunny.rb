require "rubygems"
require "bunny"

b = Bunny.new

# start a communication session with the amqp server
b.start

# declare a queue
q = b.queue("bunny")

# publish a message to the exchange which then gets routed to the queue
exch = b.exchange('bunny', :type => :fanout)

while 1 == 1 do
  puts "Enter message to send to everyone"
  txt = gets
  exch.publish(txt)
end

# close the connection
b.stop
