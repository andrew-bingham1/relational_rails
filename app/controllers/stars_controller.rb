class StarsController < ApplicationController
  def index
    @stars = Star.order_by
  end

  def new
  end

  def create
    star = Star.new({
      name: params[:name],
      star_type: params[:star_type],
      age: params[:age],
      size: params[:size],
      can_nova: params[:can_nova]
    })
    star.save
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
    star.update({
      name: params[:name],
      star_type: params[:star_type],
      age: params[:age],
      size: params[:size],
      can_nova: params[:can_nova]
    })
    star.save
    redirect_to "/stars/#{star.id}"
  end
end