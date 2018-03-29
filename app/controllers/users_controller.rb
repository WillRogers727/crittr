class UsersController < ApplicationController
#users_controller.rb
before_action :authenticate_user!, except: [:show] 
def index
	@search = User.ransack(params[:q])
	@users = @search.result.paginate(page: params[:page], per_page: 10)
end


def show
  @user = User.find(params[:id])
  @artworks = @user.artworks.paginate(page: params[:page], per_page: 10)
  @posts = @user.posts.paginate(page: params[:page], per_page: 10)
  @comments = @user.comments
  @page = "userHome"
end

def following
	@title = "Following"
	@user = User.find(params[:id])
	@users = @user.following
	render 'show_follow'
end

def followers
	@title = "Followers"
	@user = User.find(params[:id])
	@users = @user.followers
	render 'show_follow'
end


private

def user_params
	params.require(:user).permit(:username, :email, :password, :avatar)
end

end
