class Review < ApplicationRecord
	belongs_to :artwork
	belongs_to :user

	 validates_length_of :content, :minimum => 100, :too_short => "Please enter at least %d characters"
end
