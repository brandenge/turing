# Defining Our Own Methods
# 1: Write a method named greeting that prints out a general greeting to someone

def greeting
  p "Greetings!"
end

greeting

# What is the return value of your method? "Greetings!"
# However, if I had used the puts method instead, the return value would be nil.
# How many arguments did you pass your method? 0

#2: Write a method named custom_greeting that prints out a greeting WITH a specific name.

def custom_greeting(name)
  p "Greetings #{name}!"
end

custom_greeting("Bob")

# What is the return value of your method? "Greetings " + name + "!"
# However, if I had used the puts method instead, the return value would be nil.
# How many arguments did you pass your method? 1
# What data type was your argument(s)? A string

#3: Write a method named square that takes in one number, and returns the square of that number

def square(n)
  n ** 2
end

p square(3)

# What is the return value of your method? the number argument squared
# How many arguments did you pass your method? 1
# What data type was your argument(s)? An integer

#4: Write a method named greet_person that takes in 3 strings, a first, middle, and last name, and print outs the sentence of the entire string

def greet_person(first, middle, last)
  p "The full name is #{first} #{middle} #{last}."
end

greet_person("Joe", "Bob", "Taylor")

# What is the return value of your method? "The full name is " + first + " " + middle + " " + last + ".".
# However, if I had used the puts method instead, the return value would be nil.
# How many arguments did you pass your method? 3
# What data type was your argument(s)? All 3 arguments are strings
