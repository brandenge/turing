class MoviesController < ApplicationController
  def index
    user = User.find(params[:user_dashboard_id])
    if params[:q] == 'top rated'
      @facade = MovieFacade.new(user: user, type: :top_rated)
    else
      @facade = MovieFacade.new(user: user, type: :search, query: params[:q])
    end
  end

  def show
    user = User.find(params[:user_dashboard_id])
    @facade = MovieFacade.new(user: user, type: :details, movie_id: params[:id])
    @facade_movies = @facade.movies
  end
end
