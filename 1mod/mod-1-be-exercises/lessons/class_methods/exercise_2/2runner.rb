require './lib/user'
require 'pry'

## Create one instance of a User, and say hello to that user.
user = User.new("Parker")
puts user.say_hello


## Create many instances of Users, and see what they look like in Pry.
users = [
    {name: "Sal"},
    {name: "Brian"},
    {name: "Megan"},
  ]

user_objects = User.create_multiple(users)
#binding.pry ## What is user_objects?