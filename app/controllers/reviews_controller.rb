class ReviewsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
		@review.comment = params[:review][:comment]
		@review.restaurant_id = @restaurant.id

		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			render "/restaurants/show"

	end

	private

	def sanitized_review_params
		params.require(:review).permit(:comment, :restaurant_id)
	end

end