require 'tunestakeout.rb'

class FavoritesController < ApplicationController

  def favorite_a_suggestion

    favorite = TunesTakeOut.new.favorite_a_suggestion(session[:user_id],params[:suggestion_id])
    if favorite == 201
      @message = "Good!"
    else
    @message = "Not so good :("
    end
    @print_status = favorite
    render :favorite
  end




end