class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create

		@comment = @commentable.comments.new comment_params
		@comment.user = current_user
		@comment.save
		redirect_to @commentable, notice: "Your Comment was successfully posted"
		
	end

	def edit
	end

	def update
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @commentable, notice: "Your Comment was successfully deleted"
	end

	def upvote
		@comment = Comment.find(params[:id])
		@comment.upvote_by current_user
		redirect_back(fallback_location: root_path)
	end

	def downvote
		@comment = Comment.find(params[:id])
		@comment.downvote_by current_user
		redirect_back(fallback_location: root_path) #maybe change to - :back returns you to the same page - upvotes/downvotes can be on index and show pages
	end

	private

  def comment_params
    params.require(:comment).permit(:comment)
  end 


end
