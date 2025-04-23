class ApplicationController < ActionController::Base
  # Redirect after sign out
  def after_sign_in_path_for(resource)
    if resource.role == "barber"
      appointments_path  # Redirect barbers to appointments page after login
    else
      root_path  # Redirect members to home page (or wherever you want)
    end
  end


  # Permit additional fields for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :pronouns])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :pronouns])
  end
end
