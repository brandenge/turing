# =================================
# PART 1

# Define a variable that stores a string

#  call upcase on the variable, print it out
#  call downcase on the variable, print it out
#  call reverse on the variable, print it out
#  call length on the variable, print it out

greeting = "Hello World"
p greeting.upcase
p greeting.downcase
p greeting.reverse
p greeting.length

# =================================
# PART 2

user_name = "coco_11am"
last_login = "12/09/2021"

# 1: In the Ruby Docs for String methods (https://ruby-doc.org/core-3.1.0/String.html), find 4 methods you have not yet used and call them on one of the variables above. Between reading the documentation and reading the output from calling the methods, make sense of what they do.
# Write the methods out on the lines below, with an explanation in your own words of how they work.

# The String#delete method takes strings as arguments, and will delete all instances of those substring arguments from
# the calling string object. The below example's return value is "oo_11am".
p user_name.delete("c")

# The String#gsub method accepts two arguments.
# The first argument is either a regular expression (aka regex) or a string, and the second argument is a string.
# The method will match all instances of the first argument that occur in the calling string object,
# and it will replace them the string passed as the second argument.
# It returns a copy of the updated string, it is not a destructive method (but the String#gsub! method is destructive).
# The below example's return value is "aoao_11am".
p user_name.gsub(/c/, "a")

# The String#hash method takes no arguments and returns a hash value.
# The hash function for this method is based on the length, content, and encoding of the calling string object.
# It is basically a built-in hash function that you can use.
# The below example's return value will be a long integer that represents a hash value.
# Note that the hash value is different each time that the program runs.
# However, the hash value is consistent across the entire runtime of the program.
p user_name.hash
p user_name.hash

# The String#hex method takes no arguments and will convert any leading hexadecimal characters and converts them to
# a base 10 integer. Hexadecimal digits are 0-9 and a-f (not case sensitive).
# It also checks for a leading "0x" at the start of the string and ignores it, as this is a common convention
# for denoting a hexadecimal number.
# The method will truncate the rest of the string, starting at the first non-hexadecimal character that it finds.
# And the method will return 0 by default if the first character is not a hexadecimal character.
# The below example's return value is 18, because it truncates everything after the first "/" in the date string,
# And the number 12 in hex converts to the number 18 in base 10.
p last_login.hex

# 2: Do some research (either testing out with your own code or Googling) to build an understanding of what the `!` does, when at the end of a method name. Show your understading by providing an example and writing an explanation.

# The exclamation point at the end of the method name denotes that the method is a destructive method.
# This means that it mutates the calling object in-place (i.e. the object to the left of the dot operator).
# In other words, it does not create a copy of the calling object before making its changes.
# Also note that while all methods with an exclamation point at the end of their name are destructive,
# not all destructive built-in methods in Ruby have the exclamation point at the end of their name.
# Below is an example of a destructive method and a non-destructive method for comparison.
# The non-destructive version is called first and can be seen that it does not mutate the original string.
# The destructive version is called second and can be seen that it does mutate the original string.
greeting = "     Hello!     "
greeting.strip
p greeting
greeting.strip!
p greeting
