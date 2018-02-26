class Artwork < ApplicationRecord
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models
	has_many :reviews

	has_many :pictures, :dependent => :destroy


	
	# has_attached_file :image, styles: { medium: "700x500#", thumb: "350x250>" }
	# validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	# has_attached_file :image, styles: { medium: "400x250#", thumb: "250x150#" }
 #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
