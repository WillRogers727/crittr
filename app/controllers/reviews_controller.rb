class ReviewsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@artwork = Artwork.find(params[:artwork_id])
		@review = @artwork.reviews.create(review_params)
		@review.user_id = current_user.id if current_user
		if @review.save
			redirect_to artwork_path(@artwork)
		else
			render 'new'
		end


	end

	private

	def review_params
    params.require(:review).permit(:content)
  end 

end
