class ListsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :shared

  def create
    @list.creator = current_user
    if @list.save
      redirect_to @list
    else
      @lists = List.all
      render 'site/index'
    end
  end

  def show
    @task = Task.new
  end

  def destroy
    @list.destroy
    redirect_to root_path, notice: 'Successfully deleted!'
  end

  def shared
    @lists = current_user.shared_lists_with_creators
  end

  def sharing
    @collaborator_list = CollaboratorList.new
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
