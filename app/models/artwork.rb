class Artwork < ApplicationRecord
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models
	has_many :reviews

	has_many :pictures, :dependent => :destroy
	# accepts_nested_attributes_for :pictures
	# validates_presence_of :pictures
 	# validates :pictures, length: { minimum: 1 }
  # validates_associated :pictures
end
