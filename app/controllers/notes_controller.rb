class NotesController < ApplicationController

	def new
		@picture = Picture.find(params[:picture_id])
    @note = @picture.notes.build
    @page = 'newNote'
	end

	def create
		@picture = Picture.find(params[:picture_id])
		@note = @picture.notes.create(note_params)
		@note.user_id = current_user.id if current_user
 		
 		@image_file = Paperclip.io_adapters.for(@note.noteImgData)
 		@image_file.original_filename = "noteImage"
    @image_file.content_type      = "image/png"
    @note.noteImg                = @image_file

		if @note.save
			#redirect to artwork, root for now tho
      redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to root_path
	end

	private

	def note_params
    params.require(:note).permit(:content, :noteImgData, :noteImg)
	end

end
