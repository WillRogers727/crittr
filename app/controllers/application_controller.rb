class ApplicationController < ActionController::Base
	# skip_before_action :verify_authenticity_token, raise: false
  # protect_from_forgery prepend: true, with: :exception
  protect_from_forgery with: :null_session
	before_action :authenticate_user!
# 	before_filter :configure_permitted_parameters, if :devise_controller?

# 	protected

# 	def configure_permitted_parameters
# 		devise_parameter_sanitizer.for(:sign_up) << :username
# 		devise_parameter_sanitizer.for(:account_update) << :username
# 	end

# end

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end

  def after_sign_in_path_for(resource)
  	sign_in_url = new_user_session_url
  	if request.referer == sign_in_url || request.referer.include?("google")
  		super
  		goals_path
  	else
  		stored_location_for(resource) || request.referer || root_path
  	end
  end	


end
