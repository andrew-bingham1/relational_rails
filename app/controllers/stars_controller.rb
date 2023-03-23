class StarsController < ApplicationController
  def index
    @stars = Star.order_by
  end

  def show
    @star = Star.find(params[:id])
  end
end