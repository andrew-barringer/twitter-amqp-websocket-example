require 'bunny'

class Item < ActiveRecord::Base
  attr_accessible :description

  after_commit :do_bunny


private	       
  def do_bunny

   b = Bunny.new

   # start a communication session with the amqp server
   b.start

   # declare a queue
   q = b.queue("bunny")

   # publish a message to the exchange which then gets routed to the queue
   exch = b.exchange('bunny', :type => :fanout)
   exch.publish(self.to_json)
  end

end
