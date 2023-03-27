class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    planet = Planet.find(params[:id])
    planet.update(planet_params)
    redirect_to "/planets/#{planet.id}"
  end

  def planet_params
    params.permit(:name, :planet_type, :diameter, :num_moons, :has_life)
  end
end