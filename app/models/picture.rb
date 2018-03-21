class Picture < ApplicationRecord
	belongs_to :artwork
	has_many :notes, :dependent => :destroy

	validates :image, attachment_presence: true
  has_attached_file :image, 
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"


	
	validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes

end
