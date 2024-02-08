# Venue


# Instructions
* Fork this Repository
* Clone your forked repo
* Complete the activity Below
* Push your solution to your repo
* Submit a Pull Request from your repo to this repo
* Put your name in your PR!

# Iteration 1

For iteration 1, we have created all of the tests you will need
unskip tests one by one (by removing 'skip') and make each pass before
moving on to the next test. The tests will model the following interaction pattern:

```ruby
pry(main)> require './lib/venue'
#=> true

pry(main)> venue = Venue.new('Bluebird', 4)
=> #<Venue:0x00007fed7c11dbd8 @capacity=4, @name="Bluebird", @patrons=[]>

pry(main)> venue.name
=> "Bluebird"

pry(main)> venue.capacity
=> 4

pry(main)> venue.patrons
=> []
```

# Iteration 2
For iteration 2, we have created all of the tests you will need  
unskip tests one by one, making each pass before moving on the the next test.
The tests will model the interaction pattern below.

`yell_at_patrons` should return an array of patrons with their names in call caps

```ruby
pry(main)> require './lib/venue'
#=> true

pry(main)> venue = Venue.new('Bluebird', 4)
=> #<Venue:0x00007fed7c11dbd8 @capacity=4, @name="Bluebird", @patrons=[]>

pry(main)> venue.add_patron('Mike')
pry(main)> venue.add_patron('Megan')
pry(main)> venue.add_patron('Bob')

pry(main)> venue.patrons
=> ["Mike", "Megan", "Bob"]

venue.yell_at_patrons
=> ["MIKE", "MEGAN", "BOB"]

```

# Iteration 3
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The method `over_capacity` will return true or false if the venue has more patrons
than the capacity

```ruby
pry(main)> require './lib/venue'
#=> true

pry(main)> venue = Venue.new('Bluebird', 4)
=> #<Venue:0x00007fed7c11dbd8 @capacity=4, @name="Bluebird", @patrons=[]>

pry(main)> venue.add_patron('Mike')
pry(main)> venue.add_patron('Megan')
pry(main)> venue.add_patron('Bob')

pry(main)> venue.over_capacity?
=> false

pry(main)> venue.add_patron('James')
pry(main)> venue.add_patron('Cat')

pry(main)> venue.over_capacity?
=> true

```


# Iteration 4
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The `kick_out` method will continue to remove patrons from the venue until it is
no longer over capacity

```ruby
pry(main)> require './lib/venue'
#=> true

pry(main)> venue = Venue.new('Bluebird', 4)
=> #<Venue:0x00007fed7c11dbd8 @capacity=4, @name="Bluebird", @patrons=[]>

pry(main)> venue.add_patron('Mike')
pry(main)> venue.add_patron('Megan')
pry(main)> venue.add_patron('Bob')
pry(main)> venue.add_patron('James')
pry(main)> venue.add_patron('Cat')

pry(main)> venue.kick_out

pry(main)> venue.over_capacity?
=> false

```
