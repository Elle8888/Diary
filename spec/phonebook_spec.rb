require "phonebook"

describe PhoneBook do
  context "#extract_numbers" do
    it "stores a number" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("12345678910")
      expect(phone_book.list).to eq ["12345678910"]
    end
    
    it "extracts the number from a text" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello 12345678910")
      expect(phone_book.list).to eq ["12345678910"]
    end
    
    it "extracts multiple numbers from a text" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello 12345678910 10987654321")
      expect(phone_book.list).to eq ["12345678910","10987654321"]
    end
    
    it "does not extract numbers if there are no numbers in the text" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello")
      expect(phone_book.list).to eq []
    end 

    it "does not extract the number if < 10 characters" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello 123456789")
      expect(phone_book.list).to eq []
    end
  end

  context "#list" do
    it "returns an empty list with no entries" do
      phone_book = PhoneBook.new
      expect(phone_book.list).to eq []
    end

    it "returns a list with multiple entries" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello 12345678910")
      phone_book.extract_numbers("Hello 10987654321")
      expect(phone_book.list).to eq ["12345678910","10987654321"]
    end

    it "avoids duplicate entries" do
      phone_book = PhoneBook.new
      phone_book.extract_numbers("Hello 12345678910")
      phone_book.extract_numbers("Hi 12345678910")
      expect(phone_book.list).to eq ["12345678910"]
    end
  end
end