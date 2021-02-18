class ApplicationController < ActionController::Base
  # Pour devise, ligne critique à ne pas toucher
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :address, :bio, :avatar, :banner] )
    devise_parameter_sanitizer.permit(:account_update, keys:[:first_name, :address, :bio, :avatar, :banner] )
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à accéder à cette page."
    redirect_to(request.referrer || root_path)
  end
end
