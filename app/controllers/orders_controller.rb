class OrdersController < ApplicationController
  before_action :set_vehicle, only: [:new, :create]

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.vehicle = @vehicle
    @order.user = current_user
    @order.total_amount = total_amount(@order.start_date, @order.end_date, @vehicle.daily_price)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def index
    @orders = Order.where(user: current_user).order("id DESC")
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date, :total_amount)
  end

  def total_amount(start_date, end_date, daily_price)
    (end_date - start_date).to_i * daily_price
  end
end
