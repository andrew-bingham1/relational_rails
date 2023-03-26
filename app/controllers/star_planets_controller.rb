class StarPlanetsController < ApplicationController
  def index
    @star = Star.find(params[:star_id])
    @planets = @star.planets
  end

  def new
  end
  
end