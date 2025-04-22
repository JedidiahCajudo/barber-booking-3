class ApplicationController < ActionController::Base
  # Redirect after sign out
  def after_sign_out_path_for(resource_or_scope)
    root_path  # or specify the path you want to redirect to, e.g., login_path
  end
end
