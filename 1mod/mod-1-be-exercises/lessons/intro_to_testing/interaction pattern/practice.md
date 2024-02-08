```ruby
pry(main)> require './lib/mod'
=> true

pry(main)> mod_1 = Mod.new('Mod 1', 'Intro To OOP')
=> #<Mod:0x007fa71e12c1f0 @name='Mod 1', @description="Intro To OOP", @students = []>

pry(main)> mod_1.name
=> "Mod 1"

pry(main)> mod_1.description
=> "Intro To OOP"

pry(main)> mod_1.students
=> []

pry(main)> require './lib/student' 
=> true

pry(main)> chris = Student.new('chRIs')
pry(main)> richard = Student.new('RiCHard')
pry(main)> meg = Student.new('meG')
pry(main)> mod_1.add_student(chris)
pry(main)> mod_1.add_student(richard)
pry(main)> mod_1.add_student(meg)

pry(main)> mod_1.students
=> [#<Student:0x007fa71e12c1f0 @name='Chris'...>, #<Student:0x007fa71e12c1f0 @name='Richard'...>, #<Student:0x007fa71e12c1f0 @name='Meg'...>]

pry(main)> mod_1.capitalized_student_names
=> ["Chris","Richard","Meg"]


pry(main)> mod_1.alphabetical_student_names
=>  ["Chris","Meg","Richard"]
```
