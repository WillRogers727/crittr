class UsersController < ApplicationController
#users_controller.rb
before_action :authenticate_user!, except: [:show] 
#make sure user is signed in to access any pages, except for the show page so that others can view it


def index
	@search = User.ransack(params[:q])
	@users = @search.result.paginate(page: params[:page], per_page: 10)
	#fetch all users as filtered by the search bar
end

#find current user with id, the fetch all artworks and posts by that user
def show
  @user = User.find(params[:id])
  @artworks = @user.artworks.paginate(page: params[:page], per_page: 10)
  @posts = @user.posts.paginate(page: params[:page], per_page: 10)
  @comments = @user.comments
  @page = "userHome"
end

#select all of the current user's following list for display purposes - this page isnt used
def following
	@title = "Following"
	@user = User.find(params[:id])
	@users = @user.following
	render 'show_follow'
end

#select all of the current user's followers list for display purposes - this page isnt used
def followers
	@title = "Followers"
	@user = User.find(params[:id])
	@users = @user.followers
	render 'show_follow'
end


private
#defined strong params 
def user_params
	params.require(:user).permit(:username, :email, :password, :avatar)
end

end
