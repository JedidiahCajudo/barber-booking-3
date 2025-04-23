class ApplicationController < ActionController::Base
  # Redirect after sign out
  def after_sign_out_path_for(resource_or_scope)
    root_path  # or specify the path you want to redirect to, e.g., login_path
  end

  # Permit additional fields for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :pronouns])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :pronouns])
  end
end
