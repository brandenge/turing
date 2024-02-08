# Goal
# Create a program that takes an array of strings as input that represent travel destinations
# And print each travel destination in alphabetic order inside of a sentence using string interpolation

# Pseudocode
# 1) Define a method called places_to_visit that takes a parameter called places
# 2) Use the #sort method to sort the array
# 3) Use the #each method to iterate over the sorted places array
#   4) For each place, print a sentence with the place using string interpolation

def places_to_visit(places)
  places.sort.each { |place| p %Q(The next place I want to visit is #{place}) }
end

places = ['New York City', 'Helsinki', 'Espoo', 'Seattle', 'North Bend']

places_to_visit(places)
