class CollaboratorListsController < ApplicationController
  before_action :set_list
  def create
    @collaborator_list = CollaboratorList.new(collaborator_list_params.merge(list: @list))

    if @collaborator_list.save
      redirect_to sharing_list_path(@list), notice: 'Successfully Shared!'
    else
      render 'lists/sharing'
    end
  end

  def destroy
    @collaborator_list = @list.collaborator_lists.find(params[:id])
    @collaborator_list.destroy
    redirect_to sharing_list_path(@list), notice: 'Successfully Removed Collaborator!'
  end

  private
  def collaborator_list_params
    params.require(:collaborator_list).permit(:collaborator_email)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
