class Note < ApplicationRecord

	belongs_to :user
	belongs_to :picture


	has_attached_file :noteImg

  # before_validation :set_image
	validates_attachment_content_type :noteImg,
                                     content_type: %w(image/jpeg image/jpg image/png image/gif),
                                     message: "is not gif, png, jpg, or jpeg." 


	# def save_base64_note_image(base64_note_image)
 #    if base64_note_image.present?
 #      file_path = "tmp/note_image_#{self.id}.png"
 #      File.open(file_path, 'wb') { |f| f.write(Base64.decode64(base64_note_image)) }
 #      # set the paperclip attribute and let it do its thing
 #      self.noteImg = File.new(file_path, 'r')
 #    end
 #  end  


 # def add_picture(picture_64, picture_name)
 #    picture_data                   = Paperclip.io_adapters.for(picture_64)
 #    picture_data.original_filename = picture_name
 #    self.noteImg = picture_data
 #  end

 # def set_image
 #    unless self.noteImgData.nil?
 #      # data = Paperclip.io_adapters.for(self.noteImgData)
 #      # self.noteImg = data
 #      # self.noteImgData = nil
 #      sio = StringIO.new(Base64.decode64(noteImgData))
 #      puts sio.respond_to?(:original_filename)
 # 			puts sio.respond_to?(:content_type)
 # 			self.noteImg = sio

 #    end
 #  end
end

