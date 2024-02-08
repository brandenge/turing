class MovieFacade
  attr_reader :user,
              :type,
              :movies,
              :query

  def initialize(user:, type:, query: nil, movie_id: nil)
    @user = user
    @type = type
    @query = query
    @movies = data_by_type(movie_id)
  end

  delegate :name, to: :user, prefix: true

  private

  def data_by_type(movie_id)
    case type
    when :viewing_parties then viewing_parties
    when :details then movie_details(movie_id)
    when :top_rated then top_20_movies
    when :search then search_movies(query)
    end
  end

  def movie_details(movie_id)
    Movie.new(service.full_movie_details(movie_id))
  end

  def viewing_parties
    viewing_parties = @user.viewing_parties.map do |viewing_party|
      {
        viewing_party: viewing_party,
        user_type: user.user_type(viewing_party.id),
        movie: Movie.new(service.full_movie_details(viewing_party[:movie_id]))
      }
    end
  end

  def top_20_movies
    movies_array(service.top_rated_movies)
  end

  def search_movies(query)
    movies_array(service.search_movies(query))
  end

  def movies_array(movies_data)
    @_movies ||= movies_data.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def service
    @_service ||= MovieService.new
  end
end
