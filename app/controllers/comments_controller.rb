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
	end

	private

  def comment_params
    params.require(:comment).permit(:comment)
  end 


end
