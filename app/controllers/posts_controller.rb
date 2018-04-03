class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
	before_action :find_category, only: [:index]
	before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
	include Commentable

	def index #index through all of the various posts
		@page = "index"
		@categories = Category.all

		if @category.id == 1 
			if params[:tag]
				@allPosts = Post.all
				@search = @allPosts.tagged_with(params[:tag]).ransack(params[:q])
		  		@posts = @search.result.paginate(page: params[:page], per_page: 25)
			else
				@allPosts = Post.all
				@search = @allPosts.ransack(params[:q])
		  		@posts = @search.result.paginate(page: params[:page], per_page: 25)
			end
		else
			if params[:tag]
				@search = @category.posts.tagged_with(params[:tag]).ransack(params[:q])
	  			@posts = @search.result.paginate(page: params[:page], per_page: 25)
			else
				@search = @category.posts.ransack(params[:q])
	  			@posts = @search.result.paginate(page: params[:page], per_page: 25)
			end
		end


			

  	
	end

	def show
		@page = 'postShow'
	end

	def new
		@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
		@post = current_user.posts.build

	end

	def create
		@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
		@post = current_user.posts.build(post_params)
		@post.completed = false;
		if @post.save
			redirect_to @post, notice: "Post submitted successfully"
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
		redirect_to category_posts_path(1) #posts forum index page cat 1
	end

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		redirect_back(fallback_location: root_path)
	end

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by current_user
		redirect_back(fallback_location: root_path)
	end

	def set_completed
		@post = Post.find(params[:id])
		@post.update_attribute(:completed, true)
		redirect_to @post
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def find_category
		@category = Category.find(params[:category_id])
	end


	def post_params
		params.require(:post).permit(:title, :content, :tag_list, :category_id, :nsfw)
	end

end
