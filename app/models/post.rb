class Post < ApplicationRecord
	acts_as_votable
	belongs_to :user
	has_many :comments, as: :commentable #polymorphic association so that comments can be made on multiple models
end 
