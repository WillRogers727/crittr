class RelationshipsController < ApplicationController
	before_action :authenticate_user!


	#create relationship using id of followed user, then redirect to that users page again
	def create
		user = User.find(params[:followed_id])
		current_user.follow(user)
		redirect_to user
		# respond_to do |format|
  #   	format.html { redirect_to @user }
  #     format.js   { render layout: false, content_type: 'text/javascript' }
  #   end
	end

	#delete relationship using id of followed user, then redirect to that users page again
	def destroy
	  user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
    # respond_to do |format|
    #  	format.html { redirect_to @user }
    #   format.js   { render layout: false, content_type: 'text/javascript' }
    # end

	end

end
