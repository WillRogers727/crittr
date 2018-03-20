class PagesController < ApplicationController

	def home
		if user_signed_in?
			@artTitle = "Your Artwork Feed"
			@postTitle = "Your Post Feed"
			@artworks = current_user.artworkFeed.order("created_at DESC")
			@posts = current_user.postFeed.order("created_at DESC")
		else	
			@artTitle = "Current Top Artworks"
			@postTitle = "Current Top Posts"
			@artworks = Artwork.limit(10).order("cached_weighted_total DESC")
			@posts = Post.limit(10).order("cached_weighted_total DESC")
		end
	end

end
