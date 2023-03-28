class StarPlanetsController < ApplicationController
  def index
    @star = Star.find(params[:star_id])
    @planets = @star.sort_by_name(params[:sort])
  end

  def new
  end

  def create
    @star = Star.find(params[:star_id])
    planet = @star.planets.create(planet_params)
    redirect_to "/stars/#{@star.id}/planets"
  end

private
  def planet_params
    params.permit(:name, :planet_type, :diameter, :num_moons, :has_life)
  end
end