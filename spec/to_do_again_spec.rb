require 'to_do_again'

RSpec.describe 'To Do List/To Do' do
  it 'adds a new ToDo item to the list' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    expect(to_do_list.add(entry_1)).to eq [entry_1]
  end

  it 'adds multiple new ToDo items to the list' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    entry_2 = Todo.new("Hoover")
    to_do_list.add(entry_1)
    expect(to_do_list.add(entry_2)).to eq [entry_1, entry_2]
  end

  it 'returns all tasks marked incomplete - 1' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    entry_2 = Todo.new("Hoover")
    to_do_list.add(entry_1)
    to_do_list.add(entry_2)
    expect(to_do_list.incomplete).to eq [entry_1, entry_2]
  end

  it 'returns all tasks marked as complete - 1' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    entry_2 = Todo.new("Hoover")
    to_do_list.add(entry_1)
    to_do_list.add(entry_2)
    entry_1.mark_done!
    expect(to_do_list.complete).to eq [entry_1]
  end

  it 'returns tasks marked incomplete - 2' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    entry_2 = Todo.new("Hoover")
    to_do_list.add(entry_1)
    to_do_list.add(entry_2)
    entry_1.mark_done!
    expect(to_do_list.incomplete).to eq [entry_2]
  end

  it 'marks all entries as complete' do
    to_do_list = TodoList.new
    entry_1 = Todo.new("Take out trash")
    entry_2 = Todo.new("Hoover")
    to_do_list.add(entry_1)
    to_do_list.add(entry_2)
    to_do_list.give_up!
    expect(to_do_list.complete).to eq [entry_1, entry_2]
  end
end