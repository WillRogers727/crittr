class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@parent_id = params.delete(:parent_id)
		@commentable = find_commentable
		@comment = Comment.new(:parent_id => @parent_id, :commentable_id => @commentable.id, :commentable_type => @commentable.class.to_s)
		
	end

	def create
		@commentable = find_commentable
		@comment = @commentable.comments.build(comment_params) # This is the line that causes the error
		# @comment = @commentable.comments.build(comment_params)--when changed to this, the submit button simply stops submitting anything
		@comment.user = current_user
		@comment.save

		# if @comment.save
		# 	redirect_to @commentable
		# else
		# 	redirect_to @commentable
		# end

		respond_to do |format|
			format.html { redirect_to @commentable }
			format.js
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
    params.require(:comment).permit(:comment, :parent_id, :commentable_id, :commentable_type)
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
