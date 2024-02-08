class Movie
  attr_reader :id,
              :title,
              :image_url,
              :rating,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @image_url = data[:image_url]
    @rating = data[:rating]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:summary]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end
end
