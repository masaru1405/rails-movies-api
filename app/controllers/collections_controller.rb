class CollectionsController < ApplicationController
  before_action :service_movies

  def index
    @page = params.fetch(:page, 1).to_i
    @collections = @movie_api.search_collections('mary', @page)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end

end
