class ArtworksController < ApplicationController
before_action :find_artwork, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
before_action :find_category, only: [:index]
before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
include Commentable

def index
	@categories = Category.all
	
	if @category.id == 1 
		
		if params[:tag]
			@allArtworks = Artwork.all
			@search = @allArtworks.tagged_with(params[:tag]).ransack(params[:q])
	  	@artworks = @search.result
		else
			@allArtworks = Artwork.all
			@search = @allArtworks.ransack(params[:q])
	  	@artworks = @search.result
		end
	else
		if params[:tag]
			@search = @category.artworks.tagged_with(params[:tag]).ransack(params[:q])
	  	@artworks = @search.result
		else
			@search = @category.artworks.ransack(params[:q])
	  	@artworks = @search.result
		end

	end

end

def show
	@artwork = Artwork.find(params[:id])
	@pictures = @artwork.pictures
end

def new
	@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build
end

def create
	# @artwork = Artwork.new(artwork_params)
	@categories = Category.all.reject { |c| c.name == "All" }.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build(artwork_params)
	@artwork.completed = false;
	# respond_to do |format|
		if @artwork.save
			if params[:images]
				params[:images].each { |image| 
					@artwork.pictures.create(image: image)
				}
			end

			redirect_to @artwork, notice: "Artwork submitted successfully"
		else
			render 'new'
		# end
	end

	# @artwork = current_user.artworks.build(artwork_params)

	# if @artwork.save
	# 		redirect_to @artwork #if artwork is saved redirect to it's page
	# 	else
	# 		render 'new' #else render the form again
	# 	end
end

def edit
	@artwork = Artwork.find(params[:id])
	@categories = Category.all.map{|c| [c.name, c.id] }
end

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

def destroy
	@artwork = Artwork.find(params[:id])
	@artwork.destroy
	redirect_to root_path
end

def upvote
	@artwork = Artwork.find(params[:id])
	@artwork.upvote_by current_user
	redirect_back(fallback_location: root_path)
end

def downvote
	@artwork = Artwork.find(params[:id])
	@artwork.downvote_by current_user
	redirect_back(fallback_location: root_path)
end

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

	def artwork_params
		params.require(:artwork).permit(:title, :description, :pictures, :tag_list, :category_id)
	end


end
