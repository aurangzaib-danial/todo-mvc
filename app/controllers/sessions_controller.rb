class SessionsController < ApplicationController
  
  before_action :redirect_if_logged_in, except: :destroy

  def create
    auth_hash ? auth_login : normal_login
  end

  def destroy
    self.current_user = nil if logged_in?
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_login
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_path
  end

  def normal_login
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      self.current_user = @user
      redirect_to root_path
    else
      flash.now[:error] = 'Incorrect Email/Password'
      render :new
    end
  end
end
