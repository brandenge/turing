# Goal
# Create a program that takes an array of strings as input
# And returns only the words from the input array that begin with the letter "t" (case sensitive)

# Pseudocode
# 1) Define a method called t_words that takes a parameter called words
# 2) Call the #filter method on the words parameter
#   3) For each iteration of each word, compare the first character of the word to the letter "t"

def t_words(words)
  words.filter { |word| word[0] == 't' }
end

animals = %w[bobcat turtle snake horse Termite]

p t_words(animals)
