class PlanetsController < ApplicationController
  def index
    # @planets = Planet.all
    @planets = Planet.show_life
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

  def destroy
    Planet.destroy(params[:id])
    redirect_to '/planets'
  end
  
private
  def planet_params
    params.permit(:name, :planet_type, :diameter, :num_moons, :has_life)
  end
end