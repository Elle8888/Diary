class PhoneBook
  def initialize
    @numbers = []
  end

  def extract_numbers(text) #text is a string representing a journal entry
    text.scan(/\d{11}/).each do |number|
      @numbers << number
    end
    @numbers.uniq!
  end

  def list
   return @numbers
  end
end