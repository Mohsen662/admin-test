class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :store_current_location, :unless => :devise_controller?
  helper_method :logged_in?

  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be looged in to perform that action"
      redirect_to root_path
    end
  end

  def requier_admin_user
    if current_user.nil?
      flash[:danger] = "You must be looged in as admin to perform that action"
      redirect_to root_path
    elsif !current_user.admin?
      flash[:danger] = "You must be looged in as admin to perform that action"
      redirect_to root_path
    end
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end
  
end
