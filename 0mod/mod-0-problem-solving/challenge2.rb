# Goal
# Create a program that takes an array of strings as input
# And prints every word in the array of strings in all lowercase letters
# The return value is not specified, so I will return nil

# Pseudocode
# 1) Define a method called lower_case_words that takes a words parameter
# 2) Use the #map method to iterate over the words array
#   3) For each word in the words array, return the word in all lowercase letters
# 4) Use the #puts method to iterate through the array and print each string

def lower_case_words(words)
  puts words.map { |word| word.downcase }
end

names = %w[Tom Charlie Kate Amy Joey]

lower_case_words(names)
