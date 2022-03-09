# As a user
# So that I can record my experiences
# I want to keep a regular diary

# As a user
# So that I can reflect on my experiences
# I want to read my past diary entries

# As a user
# So that I can reflect on my experiences in my busy day
# I want to select diary entries to read based on how much time I have and my reading speed

# As a user
# So that I can keep track of my tasks
# I want to keep a todo list along with my diary

# As a user
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers in all my diary entries
require 'challenge'

class Diary
  def initialize
    @entries = []
    @to_do_list = []
  end

  def add(entry)
    @entries << entry
  end

  def read_entry(title)
    for entry in @entries do
      if entry.title == title
        return entry.contents
      end
    end
    return "No entry with that title"
  end

  def find_entries_to_read(minutes, wpm)
    r = []
    for entry in @entries do
      time_to_read = entry.read_time(wpm)
      r << entry if time_to_read < minutes
    end
    return r
  end

  def add_to_do(to_do)
    @to_do_list << to_do
  end

  def show_to_do_complete
    list = []
    for entry in @to_do_list do
      list << entry.task if entry.complete?
    end
    list
  end

  def show_to_do_incomplete
    list = []
    for entry in @to_do_list do
      list << entry.task if !entry.complete?
    end
    list
  end

  def show_contacts
    contacts = []
    for entry in @entries do
      number = /07\d{9}/.match(entry.contents)
      contacts << "#{number} in #{entry.title}" if !number.nil?
    end
    contacts
  end
  
end

class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def read_time(wpm)
    word_count = @contents.split(" ").count
    word_count / wpm
  end
end

class ToDo
  def initialize(task)
    @task = task
    @complete_status = false
  end

  def mark_done!
    @complete_status = true
  end

  def task
    @task
  end

  def complete?
    @complete_status
  end
end