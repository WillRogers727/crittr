class PagesController < ApplicationController

	def home
		@artworks = Artwork.limit(5).order("cached_weighted_total DESC")
		@posts = Post.limit(5).order("cached_weighted_total DESC")
	end

end
