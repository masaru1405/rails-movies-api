class MovieApi

   include HTTParty

   API_KEY = 'e2e6c0526e3737f2381684d2fd63d354'
   base_uri 'https://api.themoviedb.org/3'

   def search_movie(query, page=1, language='pt-BR')
      self.class.get('/search/movie?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page= ' + page.to_s)
   end

   def search_person(query, page=1, language='pt-BR')
      self.class.get('/search/person?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page=' + page.to_s)
   end

   def search_tv(query, page=1, language='pt-BR')
      self.class.get('/search/tv?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page=' + page.to_s)
   end

   def search_multi(query, page=1, language='pt-BR')
      self.class.get('/search/multi?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page=' + page.to_s)
   end

   def search_multi_all(query, language='pt-BR')
      temp = []
      page = 1
      limit = 10
      while page <= limit
         temp.push(self.class.get('/search/multi?api_key=' + API_KEY + '&query=' + query + '&language=' + language + '&page=' + page.to_s))
         page += 1
      end

      i = 0
      resp = []
      while i < limit 
         resp.push(temp[i]['results'])
         i += 1
      end

      #Para cada resp[i] terá 20 objetos. O i pode ser a página, pois cada página irá retornar sempre 20 objetos.
      #Para ver apenas um objeto: resp[i][j]. Ex: resp[0][1]
      #Para ver um campo específico: resp[i][j]['media_type']
      return resp 
   end

end