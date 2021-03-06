class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    case resource
		when User
			posts_path
		when Admin
			admins_homes_top_path
		end
  end

  def after_sign_out_path_for(resource)
    homes_top_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
