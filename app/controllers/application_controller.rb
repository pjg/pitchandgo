class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?


  def current_user
    return if session[:user_id].blank?
    User.find(session[:user_id])
  end
  helper_method :current_user
end
