require 'diary'
require 'todo'
require 'diary_entry'
require 'phonebook'

describe Diary do
  context '#add_task' do
    it 'takes an instance of to and stores it' do
      task = Todo.new('laundry')
      diary = Diary.new

      expect { diary.add_task(task) }.not_to raise_error
      expect(diary.incomplete_tasks.length).to eq 1
    end

    it 'raises an error if the argument is not a Todo instance' do
      diary = Diary.new
      expect { diary.add_task('wrong type') }.to raise_error 'Not a Todo instance'
    end
  end

  context '#incomplete_tasks' do
    it 'tests for incomplete tasks' do
      task = Todo.new('laundry')
      diary = Diary.new

      expect(diary.incomplete_tasks.length).to eq 0
      diary.add_task(task)
      expect(diary.incomplete_tasks.length).to eq 1
    end
  end

  context '#complete_tasks' do
    it 'marks tasks as complete' do
      task = Todo.new('laundry')
      diary = Diary.new
      diary.add_task(task)

      expect(diary.incomplete_tasks.length).to eq 1
      expect(diary.complete_tasks.length).to eq 0
      diary.incomplete_tasks[0].mark_done!
      expect(diary.complete_tasks.length).to eq 1
    end
  end

  context 'mark_tasks_as_done' do
    it 'marks tasks as done when all tasks have been completed' do
      diary = Diary.new
      diary.add_task(Todo.new('shopping'))
      diary.add_task(Todo.new('cooking'))
      diary.add_task(Todo.new('laundry'))
      diary.add_task(Todo.new('cleaning'))

      expect(diary.incomplete_tasks.length).to eq 4
      diary.mark_tasks_as_done
      expect(diary.complete_tasks.length).to eq 4
      expect(diary.incomplete_tasks.length).to eq 0
    end
  end

  context '#add_diary_entry' do
    it 'allows user to enter contents' do
      entry = DiaryEntry.new('my_title', 'my_contents')
      diary = Diary.new

      expect(diary.all_entries.length).to eq 0
      expect{ diary.add_diary_entry(entry) }.not_to raise_error
      expect(diary.all_entries.length).to eq 1
    end

    it 'raises an error if an argument is not a DiaryEntry' do
      diary = Diary.new

      expect { diary.add_diary_entry("not a diary entry") }.to raise_error 'Not an instance of DiaryEntry'
    end
  end

  context '#eading_chunk_from_entries' do
    it 'returns the readable chunk based on the given wpm and minutes' do
      entry = DiaryEntry.new('my_title', 'one two three')
      diary = Diary.new
      diary.add_diary_entry(entry)
      result = diary.reading_chunk_from_entries(2,1)

      expect(result).to eq ["one two"]
    end
  end

  context 'extract_all_numbers' do
    it 'extracts number from a given entry' do
      entry = DiaryEntry.new('my_title', 'one two three 12345678910')
      diary = Diary.new
      diary.add_diary_entry(entry)

      expect(diary.extract_all_numbers).to eq ['12345678910']
    end
  end
end