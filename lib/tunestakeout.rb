require 'httparty'
class TunesTakeOut
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def initialize

  end

    def find_paring(keyword)
      #gets paring from a key word.
      HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response

    end



end
