class ReviewsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@artwork = Artwork.find(params[:artwork_id])
		@review = @artwork.reviews.create(review_params)
		@review.user_id = current_user.id if current_user
		if @review.save
			redirect_to artwork_path(@artwork)
		else
			redirect_to artwork_path(@artwork), notice: "Please enter more than 100 chars"
		end


	end

	def destroy
		@artwork = Artwork.find(params[:artwork_id])
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to artwork_path(@artwork), notice: "Your Review was successfully deleted"
	end

	def approve
		@review = Review.find(params[:review_id])
		@review.upvote_by current_user
		redirect_back(fallback_location: root_path)
	end

	

	private

	def review_params
    params.require(:review).permit(:content)
  end 

end
