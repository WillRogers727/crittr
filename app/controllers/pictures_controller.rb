class PicturesController < ApplicationController
 #index and show are generic, not used within the app for individual pictures
 def index
    @artwork = Artwork.find(params[:artwork_id])
    @pictures = @artwork.pictures
  end

  def show
    @picture = Picture.find(params[:id])
  end


  #find parent artwork and build picture model
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @picture = @artwork.pictures.build
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  #redirect is found when creating an artwork, so is not neccessary here
  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      #redirect here?
    else
      
    end
  end

  #generic, find artwork and picture params, not used
  def update
    @artwork = Artwork.find(params[:artwork_id])
    @picture = @artwork.pictures.find(params[:id])
  end


  #identify picture id and destroy, then redirect back to the artowkr post
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    #need a redirect here
    redirect_back(fallback_location: root_path)
    #if artwork is no longer present fallback to the root
  end

  ##make the seclecte dpicture the default pictture assigned to the artowrk post
  def make_default
    @picture = Picture.find(params[:id])
    @artwork = Artwork.find(params[:artwork_id])

    @artwork.cover = @picture.id
    @artwork.save
  end

  private

  #defined strong params for picture
  def picture_params
    params.require(:picture).permit(:description, :artwork_id, :image)
	end

end
