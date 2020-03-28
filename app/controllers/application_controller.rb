class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_id, :logged_in?

  def current_user_id
    session[:user_id]
  end

  def logged_in?
    !!current_user_id
  end

  def current_user
    @current_user ||= User.find(current_user_id) if logged_in?
  end
end
