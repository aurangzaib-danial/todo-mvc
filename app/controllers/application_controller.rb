class ApplicationController < ActionController::Base

  private

  def verify_list_belongs_to_current_user
    redirect_to root_path if @list.user_id != current_user_id
  end
end
