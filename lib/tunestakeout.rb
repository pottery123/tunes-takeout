require 'httparty'


class TunesTakeOut
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"



    def search_pairing(keyword)#call from a controller
      #gets paring from a key word.
      data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
      data["suggestions"]

    end

    def search_id(keyword)
      data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
       data["suggestions"]


    end


    def search_favorites
      HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response

    end

    def search_businesses(keyword)
      data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
      data["suggestions"]
    end

    # def search_single_pairing_ID(id)
    #   #id should be passed from params
    #   data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
    #   data["suggestions"]["id"]
    #
    # end


    def favorite_a_suggestion(user_id,suggestion_id)
        body = {"suggestion": suggestion_id}.to_json
       response = HTTParty.post(BASE_URL + "v1/users/#{user_id}/favorites", body: body)
       response.code
    end

    def unfavorite_a_suggestion(user_id,suggestion_id)
      HTTParty.delete(BASE_URL + "v1/users/#{user_id}/favorites", body: {"suggestion": "suggestion_id"}).to_json
    end

end
