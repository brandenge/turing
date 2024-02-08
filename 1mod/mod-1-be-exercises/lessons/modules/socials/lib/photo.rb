# ./photo.rb
require './lib/commentable'

class Photo
	include Commentable

	attr_reader :image_source,
							:caption,
							:comments

	def initialize(image_source, caption)
		@image_source = image_source
		@caption = caption
		@comments = {}
		@display_string = photo_string
	end

	def photo_string
		display_string = "PHOTO" + "\n"
		display_string += "URL: #{image_source}" + "\n"
		display_string += "Caption: #{caption}" + "\n"
	end
end
