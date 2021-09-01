class MoviesController < ApplicationController
  before_action :service_movies
  def index
    @movies = @movie_api.search_movie('comics', 2)
    @search_multi = @movie_api.search_multi('mary',2)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end

end
