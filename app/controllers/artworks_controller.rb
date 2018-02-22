class ArtworksController < ApplicationController
before_action :find_artwork, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in
include Commentable

def index
	# @search = Artwork.ransack(params[:q])
	# @artworks = @search.result
	@categories = Category.all
	@category = Category.find(params[:category_id])
  @artworks = @category.artworks
end

def show
	@artwork = Artwork.find(params[:id])
	@pictures = @artwork.pictures
end

def new
	@categories = Category.all.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build
end

def create
	# @artwork = Artwork.new(artwork_params)
	@categories = Category.all.map{|c| [c.name, c.id] }
	@artwork = current_user.artworks.build(artwork_params)
	# respond_to do |format|
		if @artwork.save
			if params[:images]
				params[:images].each { |image| 
					@artwork.pictures.create(image: image)
				}
			end

			redirect_to category_artwork_path(@artwork.category_id, @artwork.id), notice: "Artwork submitted successfully"
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
	redirect_to category_artworks_path
end

def upvote
	@artwork = Artwork.find(params[:id])
	@artwork.upvote_by current_user
	redirect_to category_artwork_path(@artwork.category_id, @artwork.id)
end

def downvote
	@artwork = Artwork.find(params[:id])
	@artwork.downvote_by current_user
	redirect_to category_artwork_path(@artwork.category_id, @artwork.id)
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
	redirect_to category_artwork_path(@artwork.category_id, @artwork.id)
end



private

	def find_artwork
		@artwork = Artwork.includes(:pictures).find(params[:id])
	end

	def artwork_params
		params.require(:artwork).permit(:title, :description, :pictures, :tag_list, :category_id)
	end


end
