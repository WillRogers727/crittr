class Artworks::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Artwork.find(params[:artwork_id])
	end
end