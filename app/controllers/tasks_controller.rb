class TasksController < ApplicationController
  before_action :require_login
  before_action :set_list
  before_action :verify_list_belongs_to_current_user
  before_action :set_task, except: :create

  def create
    @task = Task.new(task_params(:description))
    @task.list = @list

    if @task.save
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  def update
    @task.update(task_params(:complete))

    redirect_to @list
  end

  def destroy
    @task.destroy

    redirect_to @list
  end

  private

  def task_params(*args)
    params.require(:task).permit(*args)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

end
