class StarsController < ApplicationController
  def index
    @stars = Star.order_by
  end

  def new
  end

  def create
    star = Star.create(star_params)
    redirect_to'/stars'
  end

  def show
    @star = Star.find(params[:id])
  end

  def edit
    @star = Star.find(params[:id])
  end

  def update
    star = Star.find(params[:id])
    star.update(star_params)
    redirect_to "/stars/#{star.id}"
  end

  def destroy
    star = Star.find(params[:id])
    star.planets.destroy_all
    star.destroy
    redirect_to '/stars'
  end

private
  def star_params
    params.permit(:name, :star_type, :age, :size, :can_nova)
  end
end