class Review < ApplicationRecord
	acts_as_votable
	belongs_to :artwork
	belongs_to :user
	validates :content, presence: true
	validates_length_of :content, :minimum => 100, :too_short => "Please enter at least %d characters"
end
