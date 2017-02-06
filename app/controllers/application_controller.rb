class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :authenticate_admin

  def authenticate_admin
    deny_admin_access unless current_user.admin?
  end
  
end
