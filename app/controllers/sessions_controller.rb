class SessionsController < ApplicationController
  
  before_action :redirect_if_logged_in, except: :destroy

  def new

  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      self.current_user = @user
      redirect_to root_path
    else
      flash.now[:error] = 'Incorrect Email/Password'
      render :new
    end
  end

  def destroy
    self.current_user = nil if logged_in?
    redirect_to root_path
  end
end
