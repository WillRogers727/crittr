class ArtworksController < ApplicationController
before_action :find_artwork, only: [:show, :edit, :update, :destroy] #so that code doesnt have to be repeated
before_action :authenticate_user!, except: [:index, :show] #makes sure the user cannot just path to a new post page without signing in

def index
	@artworks = Artwork.all.order("created_at DESC")
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


private

	def find_artwork
		@artwork = Artwork.find(params[:id])
	end


	def artwork_params
		params.require(:artwork).permit(:title, :description, :image)
	end


end