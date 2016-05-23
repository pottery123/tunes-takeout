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


    def search_favorites #this is where array is take out
      data = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=3").parsed_response
      data["suggestions"]
    end

    def search_businesses(keyword)
      data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
      data["suggestions"]
    end


    def favorites_by_id(id)
      data = HTTParty.get(BASE_URL + "/v1/suggestions/#{id}").parsed_response
      data
    end

    def my_favorites(user_id)
      data = HTTParty.get(BASE_URL + "v1/users/#{user_id}/favorites").parsed_response

      data["suggestions"].map do |fav_id|
        data = HTTParty.get(BASE_URL + "/v1/suggestions/#{fav_id}").parsed_response
        data
        # 
        # favorites_by_id(fav_id)
      end

    end



    def favorite_a_suggestion(user_id,suggestion_id)
        body = {"suggestion": suggestion_id}.to_json
       response = HTTParty.post(BASE_URL + "v1/users/#{user_id}/favorites", body: body)
       response.code
    end

    def unfavorite_a_suggestion(user_id,suggestion_id)
      body = {"suggestion": suggestion_id}.to_json
      response = HTTParty.delete(BASE_URL + "v1/users/#{user_id}/favorites", body: body)
      response
    end


end
