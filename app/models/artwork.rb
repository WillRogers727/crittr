class Artwork < ApplicationRecord
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models
	has_many :reviews

	has_many :pictures, :dependent => :destroy
  validates :title, :description, presence: true
end
