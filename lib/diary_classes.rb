class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    titles = []
    for entry in @entries do
      titles << entry.title
    end
    return titles
  end

  def count_words
    word_count = []
    for entry in @entries do
      word_count << entry.count_words
    end
    return word_count
  end

  def reading_time(wpm)
    total_words = count_words.sum
    return total_words / wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return_entry = nil
    min_diff = minutes
    max_words = wpm * minutes
    for entry in @entries do
      time_to_read = entry.reading_time(wpm)
      time_diff = minutes - time_to_read
      if time_diff < min_diff && time_diff >= 0
        return_entry = entry
        min_diff = time_diff
      end
    end
    return return_entry
  end
end

class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(/\s/).count
  end

  def reading_time(wpm)
    words = @contents.split(" ").count
    words / wpm
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
