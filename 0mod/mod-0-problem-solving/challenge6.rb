# Goal
# Create a program that takes a sentence (string) of only lowercase letters as input
# And print to the console the same sentence with the first letter of each word capitalized

# Pseudocode #1 - more concise and more readable, but less performant solution with 3 iterations
# 1) Define a method called 'capitalize_words' that takes a parameter called 'sentence'
# 2) Use the #split method to the sentence into an array of words on each space character ' '
# 3) Use the #map method to iterate over each word and return a modified copy of the array
  # 4) Use the #capitalize method to capitalize each word
  # 5) Use the #join method to join each word back into a sentence, joining on a space character ' '

# Pseudocode #2 - less concise and less readable, but more performant solution with 1 iteration
# 1) Define a method called 'capitalize_words_faster' that takes a parameter called 'sentence'
# 2) Declare a variable called 'capitalized_words' initialized to an empty string
# 3) Declare a variable called 'prev_char' initialized to a space character ' '
# 4) Use the #each_char method to iterate through each character in the sentence
#   5) Check if the prev_char is a space character
#   6) If it is, use the #upcase method on the current character and append it to 'capitalized_words'
#   7) Else, append the current character to 'capitalized_words' without modification
#   8) Reassign prev_char to the current character
# 7) Print the 'capitalized_words' variable to the console

def capitalize_words(sentence)
  p sentence.split(' ').map { |word| word.capitalize }.join(' ')
end

def capitalize_words_faster(sentence)
  capitalized_words = ''
  prev_char = ' '
  sentence.each_char do |char|
    capitalized_words += prev_char == ' ' ? char.upcase : char
    prev_char = char
  end
  p capitalized_words
end

sentence = %q(Turing is the best)

capitalize_words(sentence)
capitalize_words_faster(sentence)
