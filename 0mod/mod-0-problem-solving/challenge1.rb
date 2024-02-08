# Goal
# The goal is to create a program that will accept an array of strings as input
# And return an array of only the strings with exactly 4 characters

# Pseudocode
# 1) Define a method called strings_with_four_chars and a parameter called strings
# 2) Use the #filter method on the strings parameter
#   3) Inside the code block for the #filter method, compare the length of the string to 4

def strings_with_four_chars(strings)
  strings.filter { |string| string.length == 4 }
end

names = %w[Tom Charlie Kate Amy Joey]

p strings_with_four_chars(names)
