class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
	before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
	include Commentable

	def index #index through all of the various posts
		# @search = Post.ransack(params[:q])
		# @posts = @search.result
		@categories = Category.all
		@category = Category.find(params[:category_id])
  	@posts = @category.posts
	end

	def show
	end

	def new
		@categories = Category.all.map{|c| [c.name, c.id] }
		@post = current_user.posts.build
	end

	def create
		@categories = Category.all.map{|c| [c.name, c.id] }
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to category_post_path(@post.category_id, @post.id), notice: "Post submitted successfully"
		else
			render 'new' #else render the form again
		end
	end

	def edit
		@categories = Category.all.map{|c| [c.name, c.id] }
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

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		redirect_to category_post_path(@post.category_id, @post.id)
	end

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by current_user
		redirect_to category_post_path(@post.category_id, @post.id)
	end

	def set_answered
		@post = Post.find(params[:id])
		@post.update_attribute(:answered, true)
		redirect_to category_post_path(@post.category_id, @post.id)
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end


	def post_params
		params.require(:post).permit(:title, :content, :tag_list, :category_id)
	end

end
