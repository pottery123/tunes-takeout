require 'tunestakeout.rb'

class FavoritesController < ApplicationController

  def favorite_a_suggestion

    favorite = TunesTakeOut.new.favorite_a_suggestion(params[:user_id],params[:suggestion_id])
    if favorite == 201
      @message = "Good!"
    else
    @message = "Not so good :("
    end
    @print_status = favorite
    redirect_to get_my_favs_path
  end

  def get_my_favs
    @id_array = []
    @food_array = []
    @music_array = []

    @show_favorites = TunesTakeOut.new.my_favorites(current_user.uid)

    @show_favorites.each do |entire_suggestion|
      a = entire_suggestion["suggestion"]
      if a["music_type"] == "artist"
        @artist = Music.find_artist(a["music_id"])
        @music_array << @artist
      elsif a["music_type"] == "album"
        @album = Music.find_album(a["music_id"])
        @music_array << @album
      else a["music_type"] == "track"
        @track = Music.find_track(a["music_id"])
        @music_array << @track
      end

        @food = Food.find_business(a["food_id"])
        @food_array << @food

        id = a["id"]

       @id_array << id


    end


      @food_array
      @music_array
       @id_array



    render :my_favs
  end



  def destroy
    unfavorite = TunesTakeOut.new.unfavorite_a_suggestion(params[:user_id],params[:suggestion_id])
    if unfavorite == 201
      @message = "Good!"
    else
      @message = "Not so good :("
    end
    @print_status = unfavorite
    redirect_to get_my_favs_path
  end




end
