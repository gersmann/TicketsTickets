class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :notice => exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || dashboard_path
  end
  
private
  
  def set_current_user
    @user = current_user
  end
end
