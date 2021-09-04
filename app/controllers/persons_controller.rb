class PersonsController < ApplicationController
  before_action :service_movies
  
  def index
    @page = params.fetch(:page, 1).to_i
    @persons = @movie_api.search_person('mary', @page)
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end
end
