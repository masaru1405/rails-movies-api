module ApplicationHelper
   def format_date_br(date)
      ano = date.slice(0..3)
      mes = date.slice(5..6)
      dia = date.slice(8..9)
      case mes 
         when "01"
            mes = "janeiro"
         when "02"
            mes = "fevereiro"
         when "03"
            mes = "março"
         when "04"
            mes = "abril"
         when "05"
            mes = "maio"
         when "06"
            mes = "junho"
         when "07"
            mes = "julho"
         when "08"
            m = "agosto"
         when "09"
            mes = "setembro"
         when "10"
            mes = "outubro"
         when "11"
            mes = "novembro"
         else 
            mes = "dezembro"
      end
      data = "#{dia} de #{mes} de #{ano}"
      return data
   end
end
