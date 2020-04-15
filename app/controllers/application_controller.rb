class ApplicationController < ActionController::Base
  private
  def set_parent_list
    @list = List.find(params[:list_id])
  end
end
