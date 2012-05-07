
require "../bio-pipengine.rb"


class QueueManager

	#two queue for pipeline and result,
	# id_pipe for identify a single pipeline
	def initialize
		@queuePipe = Hazelcast.getQueue("pipeline")
		@queueResult = Hazelcast.getQueue("result")
		@id_pipe = 1
	end

	#enqueue_by file
	#(user,h,cpu)
	def enqueue_pipe(*pipe_p)
		if pipe_p.size == 4
			pipe = Pipeline.new(pipe_p[0],pipe_p[1],pipe_p[2],@id_pipe,"file")
		else
			pipe = Pipeline.new(pipe_p[0],pipe_h[1],pipe_p[2],@id_pipe)
		end
		#queueCustomers.offer(YAML::dump(pipe))
		#@queuePipe.put(pipe)
		@queuePipe.offer(YAML::dump(pipe))
		@id_pipe = @id_pipe +1

	end

	def dequeue_pipe
		pipe = Pipeline.new()
		#wait 5 seconds if there no items in queue
		pipe = YAML::load(@queuePipe.poll(5, TimeUnit::SECONDS))
	end


end

a = QueueManager.new()
a.enqueue_pipe("a","1","1","file")
b = a.dequeue_pipe()
puts b
b.getStep.each do |item|
	puts item['command']	
end