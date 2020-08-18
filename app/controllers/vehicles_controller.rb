class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def index
    # if params[:min_price]
    min_price = (params[:min_price] != "" && params[:min_price] !=  nil) ? params[:min_price] : 1
    max_price = (params[:max_price] != "" && params[:max_price] !=  nil) ? params[:max_price] : 2000000
    category = params[:category] || nil

    if category
      @vehicles = Vehicle.where("category = LOWER((?)) AND daily_price >= (?) AND daily_price < (?)", category, min_price, max_price)
    else
      @vehicles = Vehicle.where("daily_price >= (?) AND daily_price < (?)", min_price, max_price)
    end
  end

  def show
  end
end
