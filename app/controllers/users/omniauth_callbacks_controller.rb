class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  before_action :auth_login

  def github
  end

  def google_oauth2
  end

  def facebook
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_login
    @user = User.find_or_create_from_auth_info(auth_hash[:info])

    @user.identities.create(provider: auth_hash[:provider], uid: auth_hash[:uid])

    sign_in_and_redirect(@user)
  end

end
