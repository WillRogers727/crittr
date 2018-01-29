class PicturesController < ApplicationController
 def index

    @artwork = Artwork.find(params[:artwork_id])
    @pictures = @artwork.pictures

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @pictures }
    # end
  end

  def show
    @picture = Picture.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @picture }
    # end
  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
    @picture = @artwork.pictures.build

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @picture }
    # end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      # respond_to do |format|
      #   format.html {
      #     render :json => [@picture.to_jq_upload].to_json,
      #     :content_type => 'text/html',
      #     :layout => false
      #   }
      #   format.json {
      #     render :json => [@picture.to_jq_upload].to_json
      #   }
      # end
    else
      # render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  def update

    @artwork = Artwork.find(params[:artwork_id])

    @picture = @artwork.pictures.find(params[:id])

    # respond_to do |format|
    #   if @picture.update_attributes(picture_params)
    #     format.html { redirect_to gallery_path(@gallery), notice: 'Picture was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @picture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.js
    # end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @artwork = Artwork.find(params[:artwork_id])

    @artwork.cover = @picture.id
    @artwork.save

    # respond_to do |format|
    #   format.js
    # end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :artwork_id, :image)
end

end
