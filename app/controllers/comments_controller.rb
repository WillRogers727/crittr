class CommentsController < ApplicationController
	before_action :authenticate_user!

	#find if commentable is a post or an artowkr before building a new comment with that as the parent
	def new
		@parent_id = params.delete(:parent_id)
		@commentable = find_commentable
		@comment = Comment.new(:parent_id => @parent_id, :commentable_id => @commentable.id, :commentable_type => @commentable.class.to_s)
	end


	#redirect via ajax requirest when creating so no page refresh
	def create
		@commentable = find_commentable
		@comment = @commentable.comments.build(comment_params) # This is the line that causes the error
		@comment.user = current_user
		@comment.save

		respond_to do |format|
			format.html { redirect_to @commentable }
			format.js
		end

	end


	#destroy and redirect via ajax
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		

		respond_to do |format|
			format.html { redirect_to @commentable }
			format.js
		end
	end


	# find comment via id and assign upvote from current user using ajax
	def upvote
		@comment = Comment.find(params[:id])
		@comment.upvote_by current_user
		
		respond_to do |format|
	    format.html { redirect_back(fallback_location: root_path) }
	    format.js
	  end
	end


	# find comment via id and assign downvote from current user using ajax
	def downvote
		@comment = Comment.find(params[:id])
		@comment.downvote_by current_user
		
		respond_to do |format|
	    format.html { redirect_back(fallback_location: root_path) }
	    format.js
	  end
	end

	private

	#assigned strong params
  def comment_params
    params.require(:comment).permit(:comment, :parent_id, :commentable_id, :commentable_type)
  end 


  #find parent type - either artwork or text post
  def find_commentable
  	params.each do |name, value|
  		if name =~ /(.+)_id$/
  			return $1.classify.constantize.find(value)
    	end
    end
    nil
  end
end
