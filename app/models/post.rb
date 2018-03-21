class Post < ApplicationRecord
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable, :dependent => :destroy #polymorphic association so that comments can be made on multiple models

	validates :title, :content, presence: true

end 
