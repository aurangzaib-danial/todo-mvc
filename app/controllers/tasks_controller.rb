class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent_list
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

  def set_task
    @task = @list.tasks.find(params[:id])
  end

end
