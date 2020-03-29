class SessionsController < ApplicationController
  
  before_action :redirect_if_logged_in, except: :destroy

  def new

  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Incorrect Email/Password'
      render :new
    end
  end

  def destroy
    reset_session if logged_in?
    redirect_to root_path
  end
end
