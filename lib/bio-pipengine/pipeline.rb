# This class describe a pipeline 
# A pipeline have more step and evrey step is an process object
# A pipeline must identify by user 

require "task.rb"

class Pipeline

# attr_accessor not go on jruby

#in order to construct a pipeline by file 
# or not just spec the params byfile
#(user,h,cpu,id_pipe)
	def initialize(*args)
		if args.size == 5
			@user = args[0]
			@h = args[1]
			@cpu = args[2]
			@id_pipe = args[3]
			@step_p=[]
			@step_p = parser()
		elsif 
			@user = args[0]
			@h = args[1]
			@cpu = args[2]
			@id_pipe = args[3]
			
		end
	end
	

	def getStep
		@step_p
	end


	def parser
	    file = "../../ext/pipe.yml"
		@id_step = 1
		#must be progressive 
		if File.exist? file
				file_yml = YAML.load_file(file)
				#puts file_yml
				file_yml['pipeline'].each do |step|
						#puts step['command']
						@step_p.push Task.new(@id_pipe,@id_step,step['command'])	
						@id_step = @id_step+1
					end

        else
                        raise "File Not Found"
                
        end

	end

end

# a block test
#a = Pipeline.new("a",2,3)
#a.getStep.each do |item|
#	puts item['command']	
#end

