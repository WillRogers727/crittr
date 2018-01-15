class PostsController < ApplicationController
	def index #index through all of the various posts
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
