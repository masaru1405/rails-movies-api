module MoviesHelper
   def count_types(object)
      @movie = 0
      @person = 0
      @tv = 0
      object['results'].each do |i|  #mudar para switch
         if i['media_type'] == 'movie'
            @movie += 1
         elsif i['media_type'] == 'person'
            @person += 1
         elsif  i['media_type'] == 'tv'
            @tv += 1
         end
      end
   end

end
