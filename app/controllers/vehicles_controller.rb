class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def index
    # if params[:min_price]
    max_capacity = (params[:max_capacity] != "" && params[:max_capacity] !=  nil) ? params[:max_capacity] : 10000

    min_price = (params[:min_price] != "" && params[:min_price] !=  nil) ? params[:min_price] : 1
    max_price = (params[:max_price] != "" && params[:max_price] !=  nil) ? params[:max_price] : 2000000
    category = params[:category] || nil
    # start_date = params[:range_datepickr].split(' to ')[0]
    # end_date = params[:range_datepickr].split(' to ')[1]
    # raise
    query_dates = "
      SELECT *
      FROM vehicles
      WHERE id IN (
        SELECT
         vehicles_id
        FROM
      )
    "
    if category == "" || category =="Tous"
      category = nil
    end

    query = "capacity <= (?) AND daily_price >= (?) AND daily_price < (?)"
    if category
      @vehicles = Vehicle.where("category = LOWER((?)) AND " + query, category, max_capacity, min_price, max_price)
    else
      @vehicles = Vehicle.where(query, max_capacity, min_price, max_price)
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def article_params
    params.require(:vehicle).permit(:name, :category, :daily_price, :description, photos: [])
  end
end
