class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
	  if current_user.present?
	    current_user.apply_omniauth(request.env["omniauth.auth"])
	    redirect_to edit_user_registration_path, notice: "Facebook Account Linked!"
	  else
	    @user = User.from_omniauth(request.env["omniauth.auth"])
		  if @user
		    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
		    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		  else
		    session["devise.facebook_data"] = request.env["omniauth.auth"]
		    redirect_to new_user_registration_url
		  end
	  end
	end
end
