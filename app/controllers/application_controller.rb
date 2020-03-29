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

  private

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def require_login
    redirect_to root_path if !logged_in?
  end

  def verify_list_belongs_to_current_user
    redirect_to root_path if @list.user_id != current_user_id
  end
end
