class StarPlanetsController < ApplicationController
  def index
    @star = Star.find(params[:star_id])
    if params[:sort] == "alpha"
      @planets = @star.order_by_name
    elsif params[:sort_num].present?
      num = params[:sort_num]
      @planets = @star.num_moons_above(num)
    else
      @planets = @star.planets
    end
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