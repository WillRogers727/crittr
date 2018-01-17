class Artwork < ApplicationRecord
	belongs_to :user
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models
end
