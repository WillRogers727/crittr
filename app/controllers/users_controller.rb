class UsersController < ApplicationController
#users_controller.rb

def index
	@users = User.all
end


def show
  @user = User.find(params[:id])
  @artworks = @user.artworks
  @posts = @user.posts
  @comments = @user.comments
end



private

def user_params
	params.require(:user).permit(:username, :email, :password, :avatar)
end

end
