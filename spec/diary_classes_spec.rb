require 'diary_classes'

RSpec.describe 'diary_classes integration' do
  it 'adds new diary entries and returns all titles' do
    diary = Diary.new
    diary.add(DiaryEntry.new("08 Mar", "Tested some classes"))
    diary.add(DiaryEntry.new("09 Mar", "Tested some integrations"))
    expect(diary.all).to eq ["08 Mar", "09 Mar"]
  end

  it 'returns the number of words in all diary entries' do
    diary = Diary.new
    diary.add(DiaryEntry.new("08 Mar", "Tested some classes"))
    diary.add(DiaryEntry.new("09 Mar", "Tested some class integrations"))
    expect(diary.count_words).to eq [3, 4]
    diary.add(DiaryEntry.new("10 Mar", "Tested something else"))
    expect(diary.count_words).to eq [3, 4, 3]
  end

  it 'returns an int estimate of the reading time of all entries in minutes' do
    diary = Diary.new
    diary.add(DiaryEntry.new("08 Mar", "Tested some classes"))
    diary.add(DiaryEntry.new("09 Mar", "Tested some integrations"))
    expect(diary.reading_time(1)).to eq 6
    expect(diary.reading_time(3)).to eq 2
  end

  it 'returns diary entry closest to total that could be read, in minutes' do
    diary = Diary.new
    entry1 = DiaryEntry.new("08 Mar", "Today I tested some classes")
    entry2 = DiaryEntry.new("09 Mar", "Today I tested some multiple class integrations")
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.find_best_entry_for_reading_time(1, 6)).to eq entry1
    expect(diary.find_best_entry_for_reading_time(1, 8)).to eq entry2
  end
end