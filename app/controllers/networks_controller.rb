class NetworksController < ApplicationController
  before_action :service_movies

  def index
    @page = params.fetch(:page, 1).to_i
    @networks = @movie_api.search_network('bbc', @page)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end

end
