require 'tunestakeout.rb'
class SuggestionsController < ApplicationController


  skip_before_action :require_login, only: [:index]


  def index
    render :favorites

  end



    def find_pairing
      food_search = params[:food_search]
      @music_array = []

      @a = TunesTakeOut.new.search_pairing(food_search)
      @a.each do |suggestion|
        music =  suggestion["music_type"]
        if music == "album"

        @album =   Music.find_album(suggestion["music_id"])
        @music_array <<  @album

        elsif music == "track"
          @track = Music.find_track(suggestion["music_id"])
        @music_array <<  @track
        elsif music == "artist"
          @artist = Music.find_artist(suggestion["music_id"])
        @music_array <<  @artist
        end
        #return @ with suggestion id music_array
      end

    end

    def business_paring

      food_search = params[:food_search]
      @food_array = []
      @b = TunesTakeOut.new.search_businesses(food_search)
      @b.each do |business|
        business = Food.find_business(business["food_id"])
        @food_array << business
      end
      return @food_array
    end

    def suggestion_id
      food_search = params[:food_search]
      @id_array = []
      @c = TunesTakeOut.new.search_id(food_search)
      @c.each do |suggestion|

        id = suggestion["id"]
      @id_array << id

      end
      return @id_array
    end

    def combination

      @music = find_pairing
      @business = business_paring
      @id = suggestion_id

      render :index

    end


    def search_favorites
      @food_array = []
      @show_favorites_array = []
      @show_favorites = TunesTakeOut.new.search_favorites
      @show_favorites.each do |id|
        a = TunesTakeOut.new.favorites_by_id(id)["suggestion"]
        if a["music_type"] == "artist"
          @artist = Music.find_artist(a["music_id"])
          @show_favorites_array << @artist
        elsif a["music_type"] == "album"
          @album = Music.find_album(a["music_id"])
          @show_favorites_array << @album
        else a["music_type"] == "track"
          @track = Music.find_track(a["music_id"])
          @show_favorites_array << @track
            @show_food_favorites = TunesTakeOut.new.search_favorites
            @show_food_favorites.each do |id|
              b = TunesTakeOut.new.favorites_by_id(id)["suggestion"]
              @food = Food.find_business(b["food_id"])
              @food_array << @food
          end

        end
        @food_array
        @show_favorites_array
      end
      render :favorites
    end


    def display_food

      @food_array = []
      @show_favorites_array.each do |suggestion|
        suggestion = Food.find_business(suggestion["food_id"])
        @food_array << suggestion
      end
      return @food_array
    end


    def food_music
      @display_food = display_food
      @display_music = dispaly_music

    end
end




#controller controls what you and see only here
# def show_favorites_suggestions_controller
#   @show_favorites_array.each do |suggestion|
#     music = suggestion["suggestion"]
#       if music == ""
#
#
#
# end

=begin


def search_favorites
 @show_favorites = TunesTakeOut.new.search_favorites
render :favorites
end



<#% if ! @music.nil?%>
<#%  @music.each do |suggestion|%>
<#%=suggestion.name%><br>
<#%=link_to(suggestion.external_urls)%><br>


<#iframe src="https://embed.spotify.com/?uri=<%=  "#{suggestion.uri}" %>"width="300" height="80" frameborder="0" allowtransparency="true"></iframe>
  <#%end%>
<#%end%>
=end
