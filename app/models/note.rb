class Note < ApplicationRecord

	belongs_to :user
	belongs_to :picture


	has_attached_file :noteImg,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

	do_not_validate_attachment_file_type :noteImg
end
