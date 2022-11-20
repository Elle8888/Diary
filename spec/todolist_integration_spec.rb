require 'todo'
require 'todo_list'

describe TodoList do
  context '#add' do
    it 'adds a task to the list' do
      todo_list = TodoList.new
      todo = Todo.new('laundry')
      todo_list.add(todo)
      result = todo_list.incomplete
      expect(result[0].task).to eq 'laundry'
    end
    it 'adds multiple tasks to the list' do
      todo_list = TodoList.new
      todo1 = Todo.new('laundry')
      todo2 = Todo.new('shopping')
      todo_list.add(todo1)
      todo_list.add(todo2)
      result = todo_list.incomplete
      expect(result[0].task).to eq 'laundry'
      expect(result[1].task).to eq 'shopping'
      # result.each do |element|
      #   expect(['laundry', 'shopping']).to include(element.task)
      # end
    end

    it 'avoids duplicate input of tasks' do
      todo_list = TodoList.new
      todo1 = Todo.new('laundry')
      todo2 = Todo.new('laundry')
      todo_list.add(todo1)
      todo_list.add(todo2)
      result = todo_list.incomplete
      expect(result[0].task).to eq 'laundry'
    end

    it 'raises an error when an instance is not a Todo' do
      todo_list = TodoList.new
      expect { todo_list.add('not a Todo instance') }.to raise_error 'Not a Todo instance'
    end
  end

  context '#incomplete' do
    it 'returns incomplete taks after they are added with #add' do
      todo_list = TodoList.new
      todo = Todo.new("laundry")
      expect(todo_list.incomplete.empty?).to eq true
      todo_list.add(todo)
      expect(todo_list.incomplete.empty?).to eq false
    end
  end

  context '#complete' do
    it 'returns only completed tasks after adding them with #add' do
      todo_list = TodoList.new
      laundry = Todo.new("laundry")
      shopping = Todo.new("shopping")
      cleaning = Todo.new("cleaning")

      [laundry, shopping, cleaning].each do |item|
        expect { todo_list.add(item) }.not_to raise_error # also validates add
      end

      expect(todo_list.complete).to eq []
      laundry.mark_done!
      expect(todo_list.complete.length).to eq 1
    end
  end

  context '#give_up!' do
    it 'uses #add to add several tasks and marks all of them as done' do
      todo_list = TodoList.new
      laundry = Todo.new('laundry')
      shopping = Todo.new('shopping')
      cleaning = Todo.new('cleaning')

      [laundry, shopping, cleaning].each do |item|
        expect { todo_list.add(item) }.not_to raise_error # also validates add
      end

      expect(todo_list.complete).to eq []
      expect(todo_list.incomplete.length).to eq 3

      todo_list.give_up!
      expect(todo_list.incomplete.length).to eq 0
      expect(todo_list.complete.length).to eq 3
    end
  end
end