class NotesController < ApplicationController

	def new
		@picture = Picture.find(params[:picture_id])
    @note = @picture.notes.build
	end

	def create
		@picture = Picture.find(params[:picture_id])
		@note = @picture.notes.create(note_params)
		@note.user_id = current_user.id if current_user
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
    params.require(:note).permit(:content)
	end

end
