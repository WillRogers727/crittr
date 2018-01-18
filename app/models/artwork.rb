class Artwork < ApplicationRecord
	belongs_to :user
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models

	
	# has_attached_file :image, styles: { medium: "700x500#", thumb: "350x250>" }
	# validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_attached_file :image, styles: { medium: "400x250#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
