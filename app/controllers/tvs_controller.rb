class TvsController < ApplicationController
  before_action :service_movies

  def index
    @page = params.fetch(:page, 1).to_i
    @tvs = @movie_api.search_tv('mary', @page)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end

end
