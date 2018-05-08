class Users::RegistrationsController < Devise::RegistrationsController

	# Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if resource.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
      #update without password is provider is fb
    else
      resource.update_with_password(params)
    end
  end

end
