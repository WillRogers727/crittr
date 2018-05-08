class ReviewsController < ApplicationController
	before_action :authenticate_user!
	

	#select current artwork, create review and respond to request using ajax
	def create
		@artwork = Artwork.find(params[:artwork_id])
		@review = @artwork.reviews.create(review_params)
		@review.user_id = current_user.id if current_user
		@review.save
		respond_to do |format|
			format.html { redirect_to artwork_path(@artwork) }
			format.js
		end	
	end


	#find current artwork and review, delete review with ajax response and return to artwork
	def destroy
		@artwork = Artwork.find(params[:artwork_id])
		@review = Review.find(params[:id])
		@review.destroy

		respond_to do |format|
			format.html { redirect_to artwork_path(@artwork) }
			format.js
		end
		
	end


	#same as upvote method, use upvote_by from acts_as_votable and respond via ajax
	def approve
		@review = Review.find(params[:review_id])
		@review.upvote_by current_user

		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js
  	end
	end

	

	private

	#defined strong params
	def review_params
    params.require(:review).permit(:content)
  end 

end
