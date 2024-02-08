# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
eddie = Comedian.create!(name: "Eddie Murphy", age: 57)
chris = Comedian.create!(name: "Chris Rock", age: 45)
tig = Comedian.create!(name: "Tig Notaro", age: 43)
maria = Comedian.create!(name: "Maria Bamford", age: 37)
zach = Comedian.create!(name: "Zach Galifianakis", age: 43)

raw = eddie.specials.create!(name: "Raw", runtime: 180)
delirious = eddie.specials.create!(name: "Delirious", runtime: 150)

tamborine = chris.specials.create!(name: "Tamborine", runtime: 60)
never_scared = chris.specials.create!(name: "Never Scared", runtime: 102)
messenger = chris.specials.create!(name: "Kill the Messenger", runtime: 30)

happy = tig.specials.create!(name: "Happy to Be Here", runtime: 102)
interrupted = tig.specials.create!(name: "Boyish Girl Interrupted", runtime: 102)
drawn = tig.specials.create!(name: "Drawn", runtime: 60)

old_baby = maria.specials.create!(name: "Old Baby", runtime: 150)
the_special = maria.specials.create!(name: "The special special special", runtime: 90)

purple_onion = zach.specials.create!(name: "Live at the Purple Onion", runtime: 120)
look = zach.specials.create!(name: "Look Who It Isn't", runtime: 150)
ideas = zach.specials.create!(name: "Ideas and Characters", runtime: 102)
