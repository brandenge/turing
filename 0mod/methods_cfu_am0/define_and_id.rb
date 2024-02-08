# Run each line of code below (either from this file or in IRB individually).
#  Then, in a ruby comment, write 1-2 sentences describing what is happening, using ALL the involved vocabulary terms you've learned in this lesson so far.

# EXAMPLE
# The downcase method is called on the string object "Hello World"
# No arguments are passed; downcase has one clear job which is to lowercase all letters that exist in the String
# The return value is "hello world"
p "Hello World".downcase

# YOU DO the rest:

# The string literal "Hello World" (which is an instance of the "String" class) is the calling object.
# It uses the dot operator to access and call the "include?" method (which is a method of the "String" class).
# The "include?" method takes the string literal "Hello" as an argument when it is invoked.
# The "include?" method iterates through each character of its calling object ("Hello World", in this case),
# and it checks to see if it contains the substring that is passed to it as an argument ("Hello", in this case).
# Because "Hello World" does contain the substring "Hello", it returns the boolean literal value true.

p "Hello World".include?("Hello")

# The end_with? method is called on the string object "Hello World".
# The method will iterate through its calling object ("Hello World", in this case).
# Starting from the end of the string and iterating in reverse from back to the front,
# it will check that the string ends with the substring provided as an argument ("Hello", in this case).
# Because "Hello World" does not end in the substring "Hello", the return value is false.
p "Hello World".end_with?("Hello")

# The end_with? method is called again on the string object "Hello World".
# This time it is invoked with a different argument - the substring "rld".
# Because the string "Hello World" does end with the substring "rld", it returns the boolean value true.
p "Hello World".end_with?("rld")

# The even? method is called on the integer object 12.
# It checks if its calling object (the integer 12, in this case), is even.
# If it is an even integer, it will return true. If it is an odd integer, it will return false.
# Because 12 is an even number, it returns true.
p 12.even?

# The next method is called on the integer object 18.
# It returns the next integer that comes after it (i.e. the calling integer object, plus 1). The return value is 19.
p 18.next
