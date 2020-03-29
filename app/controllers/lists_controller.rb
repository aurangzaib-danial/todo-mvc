class ListsController < ApplicationController
  before_action :require_login
  before_action :set_list, only: :show
  before_action :verify_list_belongs_to_current_user, only: :show

  def create
    @list = List.new(list_params)
    @list.user_id = current_user_id

    if @list.save
      redirect_to @list
    else
      @lists = List.all
      render :index
    end
  end

  def show
    @task = Task.new
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
