class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def index

    min_price = 50
    max_price = 15000
    puts params
    # raise
    @vehicles = Vehicle.where("daily_price >= (?) AND daily_price < (?)", min_price, max_price)

  end

  def show
  end
end
