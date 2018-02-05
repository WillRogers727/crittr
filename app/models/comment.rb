class Comment < ApplicationRecord
	acts_as_votable
	has_ancestry
	attr_accessor :content, :parent_id, :commentable_id, :commentable_type
  belongs_to :user
  belongs_to :commentable, polymorphic: true  #polymorphic association so that comments can be made on multiple models
  #test
end
