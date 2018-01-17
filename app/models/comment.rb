class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true  #polymorphic association so that comments can be made on multiple models
end
