class KeywordsController < ApplicationController
  before_action :service_movies

  def index
    @page = params.fetch(:page, 1).to_i
    @keywords = @movie_api.search_keyword('mary', @page)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end
end
