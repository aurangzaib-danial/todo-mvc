class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent_list
  after_action :verify_authorized

  def create
    authorize @list, :show?
    @task = Task.new(task_params(:description))
    @task.list = @list

    if @task.save
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  def update
    authorize @list, :show?
    set_task
    @task.update(task_params(:complete))
    redirect_to @list
  end

  def destroy
    authorize @list, :show?
    set_task
    @task.destroy
    redirect_to @list
  end

  private

  def task_params(*args)
    params.require(:task).permit(*args)
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end
end
