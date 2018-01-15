class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated

	def index #index through all of the various posts
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post #if post is saved redirect to it's page
		else
			render 'new' #else render the form again
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end


	def post_params
		params.require(:post).permit(:title, :content)
	end

end
