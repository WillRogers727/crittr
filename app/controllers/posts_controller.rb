class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
	before_action :find_category, only: [:index]
	before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
	include Commentable

	def index #index through all of the various posts
		@page = "index"
		@categories = Category.all

		#if all category is displayed fetch all posts from all cats
		if @category.id == 1 
			#if a tag has been selected assign a title and sort via tag too
			if params[:tag]
				@tagPresent = true
				@tagName = params[:tag]
				@allPosts = Post.all
				@search = @allPosts.tagged_with(params[:tag]).ransack(params[:q])
		  		@posts = @search.result.paginate(page: params[:page], per_page: 5)
			else
				@tagPresent = false
				@allPosts = Post.all
				@search = @allPosts.ransack(params[:q])
		  		@posts = @search.result.paginate(page: params[:page], per_page: 5)
			end
			#else find posts from specific category
		else
			#sort via tag and define title
			if params[:tag]
				@tagPresent = true
				@tagName = params[:tag]
				@search = @category.posts.tagged_with(params[:tag]).ransack(params[:q])
	  			@posts = @search.result.paginate(page: params[:page], per_page: 5)
			else
				@tagPresent = false
				@search = @category.posts.ransack(params[:q])
	  			@posts = @search.result.paginate(page: params[:page], per_page: 5)
			end
		end
	end

	def show
		@page = 'postShow'
	end

	#define category list for form excluding all category
	def new
		@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
		@post = current_user.posts.build
	end


	# build post, set completed to false and redirect to the new post if successful
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

	#editing post is not possible
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

	#remove post and return to all posts page
	def destroy
		@post.destroy
		redirect_to category_posts_path(1) #posts forum index page cat 1
	end

	#find post with id and assign an upvote by the current user using ajax
	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		
		respond_to do |format|
	    format.html { redirect_back(fallback_location: root_path) }
	    format.js
	  end
	end

	#find post with id and assign an downvote by the current user using ajax
	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by current_user
		
		respond_to do |format|
	    format.html { redirect_back(fallback_location: root_path) }
	    format.js
	  end
	end

	#find post using id anmd set db attribute to true, then redirect to the post to refresh page
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

	#defined strong params for the post
	def post_params
		params.require(:post).permit(:title, :content, :tag_list, :category_id, :nsfw)
	end

end
