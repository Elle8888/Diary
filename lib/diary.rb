require 'todo_list'
require 'todo'
require 'diary_entry'
require 'phonebook'


class Diary
  def initialize
    @todo_list = TodoList.new
    @entries = []
    @phonebook = PhoneBook.new
  end

  def add_task(task)
    @todo_list.add(task)
  end

  def complete_tasks
    @todo_list.complete
  end

  def incomplete_tasks
    @todo_list.incomplete
  end

  def mark_tasks_as_done
    @todo_list.give_up!
  end

  def add_diary_entry(entry)
    raise 'Not an instance of DiaryEntry' unless entry.is_a?(DiaryEntry)
    @entries << entry
  end

  def reading_chunk_from_entries(wpm, minutes)
    @entries.map { |entry| entry.reading_chunk(wpm, minutes) }
  end

  def all_entries
    @entries
  end

  def extract_all_numbers
    all_entries.each do |entry|
      @phonebook.extract_numbers(entry.contents)
    end

    @phonebook.list
  end
end