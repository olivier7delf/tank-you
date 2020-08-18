class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def index
    @vehicles = Vehicle.all

  end

  def show
  end
end
