# All of the methods below have been started for you. To test your code, uncomment the line at the bottom of the page that
# prints out the return value of that method.


def find_all_even_numbers # done for you
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    numbers.find_all do |number|
      number.even?
    end
  end

  def find_all_odd_numbers
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    numbers.find_all do |number|
      # Your code goes here
    end

    #  expected return value is [1, 3, 5, 7, 9]
  end

  def find_all_words_with_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]

    # Your code goes here

    #  expected return value is ["bad", "cat", "dog", "red"]
  end

  def find_all_words_with_more_than_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]

    # Your code goes here

    #  expected return value is ["pill", "finger", "blue", "table"]
  end

  def find_all_words_ending_in_e
    words = ["are", "you", "strike", "thinking", "belt", "piece", "warble", "sing", "pipe"]

    # Your code goes here

    #  expected return value is ["are", "strike", "piece", "warble", "pipe"]
  end

  def find_all_words_ending_in_ing
    words = ["bring", "finger", "drought", "singing", "bingo", "purposeful"]

    # Your code goes here

    #  expected return value is ["bring", "singing"]
  end

  def find_all_words_containing_e
    words = ["four", "red", "five", "blue", "pizza", "purple"]

    # Your code goes here

    #  expected return value is ["red", "five", "blue", "purple"]
  end

  def find_all_dinosaurs
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]

    # Your code goes here

    #  expected return value is ["tyrannosaurus", "achillesaurus", "qingxiusaurus"]
  end

  def find_all_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]

    # Your code goes here

    #  expected return value is [1.4, 3.5, 4.9, 9.1, 8.0]
  end

  def find_all_arrays
    elements = ["CAT", ["dog"], 23, [56, 3, 8], "AIMLESS", 43, "butter"]

    # Your code goes here

    #  expected return value is [["dog"], [56, 3, 8]]
  end

  def find_all_hashes
    elements = ["cat", {:dog=>"fido"}, 23, {:stuff=>"things"}, "aimless", 43]
    elements.find_all do |element|
      element.is_a(Hash)
    end
    # Your code goes here

    #  expected return value is [{:dog=>"fido"}, {:stuff=>"things"}]
  end



# p find_all_even_numbers
# p find_all_odd_numbers
# p find_all_words_with_three_letters
# p find_all_words_with_more_than_three_letters
# p find_all_words_ending_in_e
# p find_all_words_ending_in_ing
# p find_all_words_containing_e
# p find_all_dinosaurs
# p find_all_floats
# p find_all_arrays
# p find_all_hashes
