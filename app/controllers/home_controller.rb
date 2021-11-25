class HomeController < ApplicationController
  before_action :service_movies
  
  def index

  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end
end
