class ApplicationController < ActionController::Base
  # Pour devise, ligne critique à ne pas toucher
  before_action  :authenticate_user!

end
