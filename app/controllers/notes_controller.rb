class NotesController < ApplicationController

	#find parent picture using id and build new note model
	def new
		@picture = Picture.find(params[:picture_id])
    @note = @picture.notes.build
    @page = 'newNote'
	end


	##create note
	def create
		@picture = Picture.find(params[:picture_id])
		@note = @picture.notes.create(note_params)
		@note.user_id = current_user.id if current_user
 		
 		#take base64 string and convert to image format using paperclip gem
 		@image_file = Paperclip.io_adapters.for(@note.noteImgData)
 		#assign fielname and image type
 		@image_file.original_filename = "noteImage"
    @image_file.content_type      = "image/png"
    #assign image to the note model
    @note.noteImg                = @image_file

		if @note.save
			#redirect to artwork after being saved
      @artwork = @picture.artwork
      redirect_to @artwork
		else
			render 'new'
		end
	end

	#find note and parent picture, destroy then redirect back to artwork
	def destroy
		@note = Note.find(params[:id])
		@picture = @note.picture
		@artwork = @picture.artwork
		@note.destroy
		redirect_to @artwork
	end

	private

	#defined strong params for notes
	def note_params
    params.require(:note).permit(:content, :noteImgData, :noteImg)
	end

end
