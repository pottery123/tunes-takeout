require 'tunestakeout.rb'
class SuggestionsController < ApplicationController


  skip_before_action :require_login, only: [:index]


  def index

  end



    def find_pairing

      # stage 1
      food_search = params[:food_search]
    # binding.pry look to see what is going on in the server

      #stage 2
      #loop  thorugh @a and put then in the find artist variable
      #find artist with id
      #music = Music.find_artist(@a["music_id"])
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


      #stage 3
      #render :index
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
      #render :index
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
     @show_favorites = TunesTakeOut.new.search_favorites
     @show_favorites["suggestions"]
    render :favorites
    end





end
#controller controls what you and see only here

=begin
<#% if ! @music.nil?%>
<#%  @music.each do |suggestion|%>
<#%=suggestion.name%><br>
<#%=link_to(suggestion.external_urls)%><br>


<#iframe src="https://embed.spotify.com/?uri=<%=  "#{suggestion.uri}" %>"width="300" height="80" frameborder="0" allowtransparency="true"></iframe>
  <#%end%>
<#%end%>
=end
