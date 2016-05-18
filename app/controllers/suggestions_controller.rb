require 'tunestakeout.rb'
class SuggestionsController < ApplicationController

  skip_before_action :require_login, only: [:index]

  def new

  end

  def find_pairing
  food_search = params[:food_search]
   TunesTakeOut.new.find_paring(food_search)
  end

end
