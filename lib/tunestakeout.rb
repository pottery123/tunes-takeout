require 'httparty'


class TunesTakeOut
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"



    def search_pairing(keyword)#call from a controller
      #gets paring from a key word.
      data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
      data["suggestions"]

    end


    def search_favorites
      HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response

    end


end
