class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end

  def user_is_logged?
    redirect_to new_session_path unless current_user
  end

  helper_method :current_user, :user_is_logged?
end
