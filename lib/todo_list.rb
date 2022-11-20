# TodoList implements list of todo tasks
class TodoList
  def initialize
    @todolist = []
  end

  # #add adds a task to todo list
  # @params [Todo] todo is an instance of Todo
  # @returns nil if complete or raise
  def add(todo)
    raise 'Not a Todo instance' unless todo.is_a?(Todo)
    return if exists?(todo)

    @todolist << todo
  end

  def incomplete
    @todolist.select { |element| element.done? == false }
  end

  def complete
    @todolist.select { |element| element.done? == true }
  end

  def give_up!
    @todolist.map(&:mark_done!)
  end

  def exists?(todo)
    @todolist.each do |element|
      return true if element == todo
    end

    false
  end
end
