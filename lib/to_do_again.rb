class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    @list << todo
  end

  def incomplete
    r = []
    for task in @list do
      r << task if !task.done?
    end
    return r
  end

  def complete
    r = []
    for task in @list do
      r << task if task.done? == true
    end
    return r
  end

  def give_up!
    for task in @list do
      task.mark_done!
    end
  end
end

class Todo
  def initialize(task) # task is a string
    @task = task
    @complete_status = false
  end

  def task
    @task
  end

  def mark_done!
    @complete_status = true
  end

  def done?
    @complete_status
  end
end