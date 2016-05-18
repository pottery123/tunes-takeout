require 'tunestakeout.rb'
class SuggestionsController < ApplicationController


  skip_before_action :require_login, only: [:index ,:find_pairing]


  def index

  end



    def find_pairing

      food_search = params[:food_search]
      #TunesTakeOut.new.suggestions(food_search)
    # binding.pry look to see what is going on in the server
      @a = TunesTakeOut.new(food_search)
      render :index
    end


    def show_favorites
    
      @show_favorites

    end




end
