class Todo
  # Initializes instance of Todo
  # @params [String] task Task to be added to todo
  def initialize(task)
    raise "not a string" unless task.is_a?(String)
    raise "task cannot be empty" if task.empty?

   @task = task
   @done = false # default value set to false
  end

  def task
    return @task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @done
  end
end