class StarPlanetsController < ApplicationController
  def index
    @star = Star.find(params[:star_id])
    @planets = @star.planets
  end
end