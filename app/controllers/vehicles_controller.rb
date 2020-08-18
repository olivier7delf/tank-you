class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def index
    @vehicles = Vehicle.all

  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def article_params
  params.require(:vehicle).permit(:name, :category, :daily_price, :description, photos: [])
end
end
