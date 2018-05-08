class PagesController < ApplicationController
	
	#define what is shown to the user on the home page depending on whether or not they are signed in,
	def home
		@page = "userHome"
		if user_signed_in?
			#show personalised feed
			@artTitle = "Your Artwork Feed" 
			@postTitle = "Your Post Feed"
			@artworks = current_user.artworkFeed.limit(10).order("created_at DESC")
			@posts = current_user.postFeed.limit(10).order("created_at DESC")
		else	
			#show generic feed of top artworks and posts
			@artTitle = "Current Top Artworks"
			@postTitle = "Current Top Posts"
			@artworks = Artwork.limit(10).order("cached_weighted_total DESC")
			@posts = Post.limit(10).order("cached_weighted_total DESC")
		end
	end

end
