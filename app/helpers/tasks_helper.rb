module TasksHelper

  def li_for_task(task)
    content_tag_for :li, task, class: ('completed' if task.complete?) do
      yield
    end
  end

  def id_for_task(task)
    "task-#{task.id}"
  end
end
