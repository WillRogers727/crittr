class Picture < ApplicationRecord
	belongs_to :artwork
	has_many :notes

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

	do_not_validate_attachment_file_type :image

end
