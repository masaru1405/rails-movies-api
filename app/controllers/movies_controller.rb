class MoviesController < ApplicationController
  before_action :service_movies
  #before_action :count_by_type

  def index
    @page = params.fetch(:page, 1).to_i
    @movies_search = @movie_api.search_movie('comics', @page)
    @movies = get_movies
    #@search_multi = @movie_api.search_multi('mary', @page)
    #@search_all = @movie_api.search_multi_all('mary')
  
  end

  private
  def service_movies
    @movie_api = MovieApi.new
  end

  def get_movies
    get_movies = []
    @movies_search['results'].each do |movie|
      temp = @movie_api.get_movie(movie['id'])
      get_movies.push(temp)
    end
    return get_movies
  end


  def count_by_type
    flag = false
    page = 1
    @m = 0 
    @t = 0 
    @p = 0
    while page < 185
      @resp = @movie_api.search_multi('mary',page)
      @resp['results'].each do |i|
        if i['media_type'] == 'movie'
          @m += 1
        elsif i['media_type'] == 'person'
          @p += 1
        elsif  i['media_type'] == 'tv'
          @t += 1
        end
      end
      page += 1
    end
  end

end
