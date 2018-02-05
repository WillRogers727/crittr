class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@parent_id = params.delete(:parent_id)
		@commentable = find_commentable
		@comment = Comment.new (:parent_id => @parent_id, 
														:commentable_id => @commentable.id, 
														:commentable_type => @commentable.class.to_s)
	end

	def create
		# @comment = @commentable.comments.new comment_params
		# @comment.user = current_user
		# @comment.save
		# redirect_to @commentable, notice: "Your Comment was successfully posted"
		@commentable = find_commentable
		@comment = @commentable.comments.build(params[:comment])
		if @comment.save
			flash[:notice] = "Successfully created comment"
				edirect_to @commentable
		else
			flash[:error] = "Error adding comment"
		end
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

  def find_commentable
  	params.each do |name, value|
  		if name =~ /(.+)_id$/
  			return $1.classify.constantize.find(value)
    	end
    end
    nil
  end
end
