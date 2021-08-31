class MovieApi

   include HTTParty

   API_KEY = 'e2e6c0526e3737f2381684d2fd63d354'
   base_uri 'https://api.themoviedb.org/3'

   def search_movie(query, page, language='pt-BR')
      self.class.get('/search/movie?api_key=' + API_KEY + '&language=' + language + '&query=' + query + '&page= ' + page.to_s)
   end

end