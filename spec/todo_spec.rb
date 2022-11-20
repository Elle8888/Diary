require 'todo'

describe Todo do

  context '#initialize' do
    it 'raises no error' do
      expect { Todo.new("I'm a string") }.not_to raise_error
    end

    it 'returns error for non-string inputs' do
      expect { Todo.new([]) }.to raise_error 'not a string'
      expect { Todo.new(1) }.to raise_error 'not a string'
      expect { Todo.new(nil) }.to raise_error 'not a string'
      expect { Todo.new(:word) }.to raise_error 'not a string'
      expect { Todo.new({}) }.to raise_error 'not a string'
    end

    it 'raise if task is empty' do
      expect { Todo.new("") }.to raise_error 'task cannot be empty'
    end
  end

  context '#task' do
    it 'returns task' do
      todo = Todo.new('laundry')
      expect(todo.task).to eq 'laundry'
    end
  end

  context '#mark_done!' do
    # need to check the task is not done by checking done? is false
    it 'mark incomplete task as done' do
      todo = Todo.new('laundry')
      expect(todo.done?).to eq false
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

  context '#done?' do
    it 'returns false if not marked done' do
      todo = Todo.new('laundry')
      expect(todo.done?).to eq false
    end

    it 'returns true if marked done' do
      todo = Todo.new('laundry')
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end