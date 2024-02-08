# In the exercises below, write your own code where indicated
# to achieve the desired result.

# One example is already completed. Your task is to complete
# any remaining prompt.

# Make sure to run the file in your command line. Look back
# at the directions from Section 1 if you need a refresher on how to do that.

#-------------------
# PART 1: Comparing variables
#-------------------

number_teachers = 4
number_students = 20
string_teachers = "4"
numberDogs = 0

# EXAMPLE: print the result of the comparison: is number_seachers greater than number_students?
puts "Is number_teachers greater than number_students?", number_teachers > number_students
# this should print: "Is numberTeachers greater than numberStudents?" false

# YOU DO: print the result of the comparison: is number_teachers less than number_students?
# this should print: true

puts "is number_teachers less than number_students?", number_teachers < number_students

# YOU DO: print the result of the comparison: is number_teachers equal to string_teachers?
# this should print: false

puts "is number_teachers equal to string_teachers?", number_teachers == string_teachers

# YOU DO: print the result of the comparison: is number_teachers not equal to number_students?
# this should print: true

puts "is number_teachers not equal to number_students?", number_teachers != number_students

# YOU DO: print the result of the comparison: is number_students greater than or equal to 20?
# this should print: true

puts "is number_students greater than or equal to 20?", number_students >= 20

# YOU DO: print the result of the comparison: is number_students greater than or equal to 21?
# this should print: false

puts "is number_students greater than or equal to 21?", number_students >= 21

# YOU DO: print the result of the comparison: is number_students less than or equal to 20?
# this should print: true

puts "is number_students less than or equal to 20?", number_students <= 20

# YOU DO: print the result of the comparison: is number_students less than or equal to 21?
# this should print: true

puts "is number_students less than or equal to 21?", number_students <= 21

#-------------------
# PART 2: Articulating what you are doing
#-------------------

# For the following prompts, you will be given a line of code and your task is to type out a Comment,
# in English, explaining what that line of code is doing, including what the comparison will evaluate to.
# Be as technically precise as possible, but don't just copy and paste a definition from the readings.
# Make sure YOU can explain it that way!

puts 4 < 9
#YOU DO: Explain.

# 1) The right-hand expression of (4 < 9) is evaluated first.

# 2) This expression is using the 'less-than' comparison operator, which is a binary operator, which means that it takes two operands.

# 3) In this case, the left operand is the integer 4, and the right operand is the integer 9.

# 4) This evaluates to the boolean literal 'true' because 4 is less than 9.

# 5) The boolean literal 'true' then becomes the argument to the 'puts' method.

# 6) The 'puts' method converts its argument (which in this case is the boolean literal 'true') to a string and sends it to the standard output stream (STDOUT) of the Ruby interpreter's environment (which is usually the terminal of the operating system) on a new line, where it is outputted.

# 7) The 'puts' method then returns 'nil'.

books = 3
puts 4 < books
# YOU DO: Explain.

=begin
# 1) A variable called 'books' is declared and initialized/assigned to the value of the integer 3.

# 2) Then the next line of code is executed, starting by evaluating the right-hand expression of (4 < books).

# 3) This expression is using the 'less-than' comparison operator, which is a binary operator, which means that it takes two operands.

# 4) In this case, the left operand is the integer 4, and the right operand is the variable books, which is currently pointing to/referencing the value of 3 in memory.

# 5) This evaluates to the boolean literal 'false' because 4 is NOT less than 3.

# 6) The boolean literal 'false' then becomes the argument to the 'puts' method.

# 7) The 'puts' method converts its argument (which in this case is the boolean literal of 'false') to a string and sends it to the standard output stream (STDOUT) of the Ruby interpreter's environment (which is usually the terminal of the operating system) on a new line, where it is outputted.

# 8) The 'puts' method then returns 'nil'.
=end

friends = 6
siblings = 2
puts friends > siblings
# YOU DO: Explain.

# 1) A variable called 'friends' is declared and initialized/assigned to the value of the integer 6.

# 2) On the next line, another variable called 'siblings' is delared and initialized/assigned to the value of the integer 2.

# 3) On the next line, the right-hand expression of (friends > siblings) is evaluated next.

# 4) This expression consists of the 'greater-than' comparison operator, which is a binary operator, which means that it takes two operands.

# 5) The left operand is the variable called 'friends', which is currently pointing to/referencing the value of 6 in memory. The right operand is the variable called 'siblings', which is currently pointing to/referencing the value of 2 in memory.

# 6) With these values currently being referenced by their respective variables, the expression evaluates to (6 > 2), which further evaluates to the boolean literal 'true', because 6 is greater than 2.

# 7) The boolean literal 'true' then becomes the argument to the 'puts' method.

# 8) The 'puts' method converts its argument (which in this case is the boolean literal of 'true') to a string and sends it to the standard output stream (STDOUT) of the Ruby interpreter's environment (which is usually the terminal of the operating system) on a new line, where it is outputted.

# 9) The 'puts' method then returns 'nil'.

attendees = 9
meals = 8
puts attendees != meals
# YOU DO: Explain.

# 1) A variable called 'attendees' is declared and initialized/assigned to the value of the integer 9.

# 2) On the next line, another variable called 'meals' is delared and initialized/assigned to the value of the integer 8.

# 3) On the next line, the right-hand expression of (attendees != meals) is evaluated next.

# 4) This expression consists of the 'not equal to' comparison operator, which is a binary operator, which means that it takes two operands.

# 5) The left operand is the variable called 'attendees', which is currently pointing to/referencing the value of 9 in memory. The right operand is the variable called 'meals', which is currently pointing to/referencing the value of 8 in memory.

# 6) With these values currently being referenced by their respective variables, the expression evaluates to (9 != 8), which further evaluates to the boolean literal 'true', because 9 is not equal to 8.

# 7) The boolean literal 'true' then becomes the argument to the 'puts' method.

# 8) The 'puts' method converts its argument (which in this case is the boolean literal of 'true') to a string and sends it to the standard output stream (STDOUT) of the Ruby interpreter's environment (which is usually the terminal of the operating system) on a new line, where it is outputted.

# 9) The 'puts' method then returns 'nil'.

#-------------------
# PART 3: Logical Operators
#-------------------

is_hungry = true
finished_homework = false

# EXAMPLE:
# Determine if the user is hungry and has completed their homework
puts is_hungry && finished_homework
# Determine if the user is hungry or has completed their homework
puts is_hungry || finished_homework

loves_to_play = true
loves_dog_park = false
loves_treats = true
age = 1

# YOU DO:
# Determine if the dog loves to play and loves treats

puts "Does the dog love to play and love treats?", loves_to_play && loves_treats

# Determine if the dog loves to play and loves the dog park

puts "Does the dog love to play and love the dog park?", loves_to_play && loves_dog_park

# Determine if the dog loves to play or loves the dog park

puts "Does the dog love to play or love the dog park?", loves_to_play || loves_dog_park

# Determine if the dog loves to play and is a puppy

puts "Does the dog love to play and is a puppy (is less than or equal to 1 year old)?", loves_to_play && age <= 1

# What did your final line of code evaluate to? Why do you think that is? Explain.
# ANSWER: It evaluated to true. However, how we define a dog as a "puppy" is a bit ambiguous and open to interpretation.
# I defined a puppy as any dog with their age less than or equal to 1 year old. With the given logical "and" operator,
# the left operand would be 'true', and with my implementation for the right operand (which is the expression age <= 1),
# the right operand also evaluates as true. Therefore, the logical "and" operator in this case will evaluate as
# true && true, which also ultimately evaluates as true still.
