class ArtworksController < ApplicationController
before_action :find_artwork, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
before_action :find_category, only: [:index]
before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
include Commentable

def index
	@page = "index"
	@categories = Category.all
	
	if @category.id == 1 
		#if all category is displayed fetch all posts from all cats
		if params[:tag]
			#if a tag has been selected assign a title and sort via tag too
			@tagPresent = true
			@tagName = params[:tag]
			@allArtworks = Artwork.all
			@search = @allArtworks.tagged_with(params[:tag]).ransack(params[:q])
	  	@artworks = @search.result.paginate(page: params[:page], per_page: 25)
		else
			@tagPresent = false
			@allArtworks = Artwork.all
			@search = @allArtworks.ransack(params[:q])
	  	@artworks = @search.result.paginate(page: params[:page], per_page: 25)
		end
	else
		#else find posts from specific category
		if params[:tag]
			#if a tag has been selected assign a title and sort via tag too
			@tagPresent = true
			@tagName = params[:tag]
			@search = @category.artworks.tagged_with(params[:tag]).ransack(params[:q])
	  	@artworks = @search.result.paginate(page: params[:page], per_page: 25)
		else
			@tagPresent = false
			@search = @category.artworks.ransack(params[:q])
	  	@artworks = @search.result.paginate(page: params[:page], per_page: 25)
		end

	end

end

#identify selected artowkr and find pictures that are children
def show
	@artwork = Artwork.find(params[:id])
	@pictures = @artwork.pictures
	@page = 'artShow'
end


#create new mapping all categories except the all category for the form
def new
	@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build
	@page = 'artNew'
end


# create category and defined completed attribute as false, then save and redirect
def create
	@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build(artwork_params)
	@artwork.completed = false;


	#if the user has submitted images
	if params[:images]
		if @artwork.save
			#for each image create a child picture object
			params[:images].each { |image| @artwork.pictures.create(image: image)}
			#redirect once successful
			redirect_to @artwork, notice: "Artwork submitted successfully"
		else
			render 'new'
		end
	else
		render 'new' #this is if no images are posted
	end
end


#unused, generic
def edit
	@artwork = Artwork.find(params[:id])
	@categories = Category.all.map{|c| [c.name, c.id] }
end


#update with new images added in the same way as on the create method
def update
	@artwork = Artwork.find(params[:id])

	respond_to do |format|
		if @artwork.update_attributes(artwork_params)
			if params[:images]
				params[:images].each { |image| 
					@artwork.pictures.create(image: image)
				}
			end

			redirect_to @artwork, notice: "Artwork submitted successfully"
		else
			render 'edit'
		end
	end
end


#identify artwork and destroy then redirect to all posts, pictures destroy automatically
def destroy
	@artwork = Artwork.find(params[:id])
	@artwork.destroy
	redirect_to category_artworks_path(1)
end

#assign upvote from current user via ajax
def upvote
	@artwork = Artwork.find(params[:id])
	@artwork.upvote_by current_user

	respond_to do |format|
    format.html { redirect_back(fallback_location: root_path) }
    format.js
  end
end


#assign downvote from current user via ajax
def downvote
	@artwork = Artwork.find(params[:id])
	@artwork.downvote_by current_user
	
	respond_to do |format|
    format.html { redirect_back(fallback_location: root_path) }
    format.js
  end
end


#method more adding pictures to an artwork post using images in an array
def create_picture
	@artwork = Artwork.find(params[:id])
	# @picture = @artwork.pictures.create(image: image)
	if params[:images]
		params[:images].each { |image| 
			@artwork.pictures.create(image: image)
		}
	end
	@artwork.save
	@pictures = @artwork.pictures
	# render :action => :show
	redirect_to @artwork
end


#method to assign completed attribute in db to ture, then redirect to refresh the page
def set_completed
	@artwork = Artwork.find(params[:id])
	@artwork.update_attribute(:completed, true)
	redirect_to @artwork
end

private

	def find_artwork
		@artwork = Artwork.includes(:pictures).find(params[:id])
	end

	def find_category
		@category = Category.find(params[:category_id])
	end

	#defined strong params for artwork
	def artwork_params
		params.require(:artwork).permit(:title, :description, :pictures, :tag_list, :category_id, :nsfw)
	end


end
