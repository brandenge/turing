class Film
  attr_reader :title,
              :description,
              :director,
              :producer,
              :release_date,
              :rotten_tomatoes
  def initialize(data)
  	@title = data[:title]
	  @description = data[:description]
	  @director = data[:director]
  	@producer = data[:producer]
  	@release_date = data[:release_date]
  	@rotten_tomatoes = data[:rt_score]
  end
end
