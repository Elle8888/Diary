class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    @contents.split.length.to_i
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm)
    raise 'Reading speed must not be 0' unless wpm > 0
    (count_words / (wpm.to_f)).ceil
    # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes)
    chunk = (minutes * wpm.to_f).ceil
    @contents.split(" ")[0..chunk-1].map { |text| text }.join(" ")
    # `wpm` is an integer representing the number
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