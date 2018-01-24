class ArtworksController < ApplicationController
before_action :find_artwork, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in

def index
	@search = Artwork.ransack(params[:q])
	@artworks = @search.result
end

def show
end

def new
	@artwork = current_user.artworks.build
end

def create
	@artwork = current_user.artworks.build(artwork_params)

	if @artwork.save
			redirect_to @artwork #if artwork is saved redirect to it's page
		else
			render 'new' #else render the form again
		end
end

def edit
end

def update
end

def destroy
	@artwork.destroy
	redirect_to root_path
end

def upvote
	@artwork = Artwork.find(params[:id])
	@artwork.upvote_by current_user
	redirect_to @artwork 
end

def downvote
	@artwork = Artwork.find(params[:id])
	@artwork.downvote_by current_user
	redirect_to @artwork #maybe change to - :back returns you to the same page - upvotes/downvotes can be on index and show pages
end

private

	def find_artwork
		@artwork = Artwork.find(params[:id])
	end


	def artwork_params
		params.require(:artwork).permit(:title, :description, :image, :cat)
	end


end
