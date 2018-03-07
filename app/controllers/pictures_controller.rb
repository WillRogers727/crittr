class PicturesController < ApplicationController
 def index
    @artwork = Artwork.find(params[:artwork_id])
    @pictures = @artwork.pictures
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
    @picture = @artwork.pictures.build
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      #redirect here?
    else
      
    end
  end
  def update

    @artwork = Artwork.find(params[:artwork_id])

    @picture = @artwork.pictures.find(params[:id])


  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    #need a redirect here
    redirect_back(fallback_location: root_path)
  end

  def make_default
    @picture = Picture.find(params[:id])
    @artwork = Artwork.find(params[:artwork_id])

    @artwork.cover = @picture.id
    @artwork.save
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :artwork_id, :image)
	end

end
