class ApplicationController < ActionController::Base
  # Pour devise, ligne critique à ne pas toucher
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action  :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :address] )
  end

end
