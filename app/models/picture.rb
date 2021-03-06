class Picture < ApplicationRecord
	belongs_to :artwork
	has_many :notes, :dependent => :destroy

  has_attached_file :image, 
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

	do_not_validate_attachment_file_type :image

	validates :image, attachment_presence: true
	validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
end
