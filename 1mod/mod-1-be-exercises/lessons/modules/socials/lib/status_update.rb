# ./status_update.rb
require './lib/commentable'

class StatusUpdate
	include Commentable

	attr_reader :body,
							:comments

	def initialize(body)
		@body = body
		@comments = {}
		@display_string = status_update_string
	end

	def status_update_string
		display_string = "STATUS UPDATE" + "\n"
		display_string += "Body: #{@body}" + "\n"
	end
end
