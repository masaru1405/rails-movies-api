class SearchController < ApplicationController
   before_action :service_movies

   def index
      @page = params.fetch(:page, 1).to_i
      @movies = get_movies(params[:term], @page)
      #@all_movies = get_all_movies(params[:term])
   end

   def list_movies
      @page = params.fetch(:page, 1).to_i
      @movies = get_movies(params[:term], @page)
   end

   def index_person

   end

   def list_persons
      @page = params.fetch(:page, 1).to_i
      @persons = @movie_api.search_person(params[:term], @page)
   end

   private
      def service_movies
         @movie_api = MovieApi.new
      end

      #Guarda o hash 'results' num array, assim não precisamos escrever
      #x['results']['name'], apenas x['name']. 
      #OBS: neste caso, o array x estará nesta forma: x = [{data1: lorem, data2: lorem}, {data1: lorem, data2: lorem}, ...]
      def get_movies(term, page)
         get_movies = []
         movies_search = @movie_api.search_movie(term, page)
         movies_search['results'].each do |movie|
            temp = @movie_api.get_movie(movie['id'])
            get_movies.push(temp)
         end
         return get_movies
      end

      def get_all_movies(term)
         get_all = []
         page = 1
         temp = @movie_api.search_movie(term, page)
         while !temp['results'].empty?
            temp['results'].each do |movie|
               get_all.push(@movie_api.get_movie(movie['id']))
            end
            page += 1
            temp = @movie_api.search_movie(params[:term], page)
         end
         return get_all
      end
end
