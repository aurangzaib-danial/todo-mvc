class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, except: %i[create shared]
  after_action :verify_authorized, except: %i[create shared]

  def create
    @list = List.new(list_params)
    @list.creator = current_user
    if @list.save
      redirect_to @list
    else
      render 'site/index'
    end
  end

  def show
    authorize @list
    @task = Task.new
  end

  def destroy
    authorize @list
    @list.destroy
    redirect_to root_path, notice: 'Successfully deleted!'
  end

  def shared
    @lists = current_user.shared_lists_with_creators
  end

  def sharing
    authorize @list
    @collaborator_list = CollaboratorList.new
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
