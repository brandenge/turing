# ./commentable.rb
module Commentable
  def display
		display_string = "-" * 50 + "\n"
		display_string += @display_string
		comments.each do |id, text|
			display_string += "#{id}: #{text}" + "\n"
		end
		display_string += "-" * 50
	end

  def add_comment(comment)
		comments[next_comment_id] = comment
	end

	def remove_comment(id)
		comments.delete(id)
	end

	def next_comment_id
		if total_comments == 0
			total_comments + 1
		else
			comments.keys.last + 1
		end
	end

	def total_comments
		comments.count
	end
end
