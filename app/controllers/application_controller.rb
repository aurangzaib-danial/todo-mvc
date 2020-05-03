class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    message = 'You are not authorized to access this page.'
    redirect_to root_path, alert: message
  end
end
