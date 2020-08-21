class ReviewsController < ApplicationController
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review = Review.new(review_params)
    @review.username = current_user.name
    @review.vehicle = @vehicle
    if @review.save
      redirect_to vehicle_path(@vehicle, anchor: "review-#{@review.id}")
    else
      render 'vehicles/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
