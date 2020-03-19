class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
