class MovieService
  API_DOMAIN = 'https://api.themoviedb.org/3'.freeze
  IMAGES_DOMAIN = 'https://image.tmdb.org/t/p/original'.freeze
  DEFAULT_IMAGE_URL = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'.freeze

  def top_rated_movies
    parsed_movies_data = get_url('movie/top_rated')
    movies_data(parsed_movies_data[:results])
  end

  def search_movies(query)
    parsed_movies_data = get_url("search/movie?query=#{query}")
    movies_data(parsed_movies_data[:results])
  end

  def full_movie_details(movie_id)
    details = get_movie_details(movie_id)
    cast = get_movie_cast(movie_id)[:cast]
    reviews = get_movie_reviews(movie_id)[:results]
    image_url = if details[:poster_path].nil?
      DEFAULT_IMAGE_URL
    else
      IMAGES_DOMAIN + details[:poster_path]
    end

    {
      id: movie_id,
      title: details[:title],
      image_url: image_url,
      rating: details[:vote_average],
      runtime: details[:runtime],
      genres: details[:genres].map { |genre| genre[:name] },
      summary: details[:overview],
      cast: cast[0..9].map do |member|
        {
          name: member[:name],
          character: member[:character]
        }
      end,
      reviews: reviews.map do |review|
        {
          author: review[:author],
          content: review[:content]
        }
      end
    }
  end

  def movies_data(response_data)
    response_data.map do |movie_data|
      image_url = if movie_data[:poster_path].nil?
                    DEFAULT_IMAGE_URL
                  else
                    IMAGES_DOMAIN + movie_data[:poster_path]
                  end

      {
        id: movie_data[:id],
        title: movie_data[:title],
        image_url: image_url,
        rating: movie_data[:vote_average]
      }
    end
  end

  private

  def get_movie_details(movie_id)
    get_url("#{API_DOMAIN}/movie/#{movie_id}")
  end

  def get_movie_cast(movie_id)
    get_url("#{API_DOMAIN}/movie/#{movie_id}/credits")
  end

  def get_movie_reviews(movie_id)
    get_url("#{API_DOMAIN}/movie/#{movie_id}/reviews")
  end

  def get_url(url)
    response = conn.get(url) do |req|
      req.headers['Authorization'] =
      "Bearer #{ENV['MOVIES_API_READ_ACCESS_TOKEN']}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: API_DOMAIN,
                headers: { 'Content-Type' => 'application/json' })
  end
end
