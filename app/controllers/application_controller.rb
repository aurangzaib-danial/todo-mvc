class ApplicationController < ActionController::Base

  private

  def verify_list_belongs_to_current_user
    redirect_to root_path if @list.creator != current_user
  end
end
