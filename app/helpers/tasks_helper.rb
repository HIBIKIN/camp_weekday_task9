module TasksHelper
  def status_color(task)
    return "#FF0000" if task.status == "draft"
    return "#0000FF" if task.status == "published"
    return "#008000" if task.status == "archieved"
  end
end
