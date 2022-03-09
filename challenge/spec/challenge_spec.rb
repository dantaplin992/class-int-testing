require 'challenge'

RSpec.describe 'super mega diary' do
  it 'adds new entries to the diary' do
    diary = Diary.new
    entry_1 = DiaryEntry.new("08 Mar", "Got a phone call from 07000000000")
    entry_2 = DiaryEntry.new("09 Mar", "Designed class system")
    diary.add(entry_1)
    expect(diary.add(entry_2)).to eq [entry_1, entry_2]
  end

  it 'reads a diary entry with the given string title' do
    diary = Diary.new
    entry_1 = DiaryEntry.new("08 Mar", "Got a phone call from 07000000000")
    entry_2 = DiaryEntry.new("09 Mar", "Designed class system")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.read_entry("08 Mar")).to eq "Got a phone call from 07000000000"
    expect(diary.read_entry("09 Mar")).to eq "Designed class system"
    expect(diary.read_entry("10 Mar")).to eq "No entry with that title"
  end

  it 'selects entries the user has time to read' do
    diary = Diary.new
    entry_1 = DiaryEntry.new("08 Mar", "Got a phone call from 07000000000")
    entry_2 = DiaryEntry.new("09 Mar", "Designed class system")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.find_entries_to_read(4, 1)).to eq [entry_2]
    expect(diary.find_entries_to_read(4, 1000)).to eq [entry_1, entry_2]
  end

  it 'adds an item to a to-do list' do
    diary = Diary.new
    to_do_1 = ToDo.new("abc")
    expect(diary.add_to_do(to_do_1)).to eq [to_do_1]
  end

  it 'returns a list of complete and incomplete to-do items' do
    diary = Diary.new
    to_do_1 = ToDo.new("Wash the dog")
    to_do_2 = ToDo.new("Walk the dog")
    diary.add_to_do(to_do_1)
    diary.add_to_do(to_do_2)
    to_do_1.mark_done!
    expect(diary.show_to_do_complete).to eq ["Wash the dog"]
    expect(diary.show_to_do_incomplete).to eq ["Walk the dog"]
  end

  it 'returns a formatted list of mobile numbers in all diary entries' do
    diary = Diary.new
    entry_1 = DiaryEntry.new("08 Mar", "Got a phone call from 07000000000")
    entry_2 = DiaryEntry.new("09 Mar", "Designed class system")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.show_contacts).to eq ["07000000000 in 08 Mar"]
    entry_3 = DiaryEntry.new("10 Mar", "07000000001 called")
    diary.add(entry_3)
    expect(diary.show_contacts).to eq ["07000000000 in 08 Mar", "07000000001 in 10 Mar"]
  end
end