class MovieApi

   include HTTParty

   API_KEY = 'e2e6c0526e3737f2381684d2fd63d354'
   base_uri 'https://api.themoviedb.org/3'

   def search_movie(query, page=1, language='pt-BR')
      self.class.get('/search/movie?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page= ' + page.to_s)
   end

   def search_multi(query, page=1, language='pt-BR')
      self.class.get('/search/multi?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page=' + page.to_s)
   end

end