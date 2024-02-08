# Goal
# Create a program that takes an array of strings as input
# And prints only the words from the input array that include the letter combination "ing"
# The return value is not specified, so I will return nil

# Pseudocode
# 1) Define a method called "words_with_ing" that takes a parameter called words
# 2) Use the #each method to iterate over the input words array
#   3) For each word in the input words array, check if the word contains the substring "ing"
#   4) If it does contain the substring "ing", print the word to the console

def words_with_ing(words)
  words.each { |word| p word if word.include?('ing') }
end

words = %w[shopping store running shoe biking trail rtingeab]

words_with_ing(words)
