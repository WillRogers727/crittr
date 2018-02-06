class Comment < ApplicationRecord
	acts_as_votable
	has_ancestry
  belongs_to :user
  belongs_to :commentable, polymorphic: true  #polymorphic association so that comments can be made on multiple models
  #test
end
