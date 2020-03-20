class TasksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params(:description))
    @task.list = @list

    if @task.save
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    @task.update(task_params(:complete))

    redirect_to @list
  end

  private

  def task_params(*args)
    params.require(:task).permit(*args)
  end
end
