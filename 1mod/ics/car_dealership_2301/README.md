# Car Dealership

## Instructions

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
* Make sure to put your name in your PR!

## Iteration 1

Start with the existing tests, and then use TDD to create a `Car` class that
responds to the following interaction pattern. You are expected to write your own
tests for the `paint!` and `color` methods.

(Where you see something like `#<Car:0x00007fccd30375f8...>`, this is
shorthand for a full car object with that object identifier - we have
replaced any attributes with `...` for readability.)

Notes: Loan length is in month, and the total cost is the loan length
multiplied by the monthly payment.

```ruby
pry(main)> require './lib/car'
#=> true

pry(main)> car = Car.new("Ford Mustang", 1500, 36)
#=> #<Car:0x00007fa53b9ca0a8...>

pry(main)> car.make
#=> "Ford"

pry(main)> car.model
#=> "Mustang"

pry(main)> car.monthly_payment
#=> 1500

pry(main)> car.loan_length
#=> 36

pry(main)> car.total_cost
#=> 54000

pry(main)> car.color
#=> nil

pry(main)> car.paint!(:blue)

pry(main)> car.color
#=> :blue

```

## Iteration 2

Use TDD to create a `Dealership` class that responds to the following interaction
pattern:

(Where you see something like `#<Dealership:0x00007fccd30375f8...>`, this is
shorthand for a full dealership object with that object identifier - we have
replaced any attributes with `...` for readability.)

```ruby

pry(main)> require './lib/car'
#=> true

pry(main)> require './lib/dealership'
#=> true

pry(main)> dealership = Dealership.new("Acme Auto", "123 Main Street")
#=> #<Dealership:0x00007fccd30375f8...>

pry(main)> dealership.inventory
#=> []

pry(main)> dealership.inventory_count
#=> 0

pry(main)> car_1 = Car.new("Ford Mustang", 1500, 36)
#=> #<Car:0x00007fa53b9ca0a8...>

pry(main)> car_2 = Car.new("Toyota Prius", 1000, 48)
#=> #<Car:0x00007fccd2985f48...>

pry(main)> dealership.add_car(car_1)

pry(main)> dealership.add_car(car_2)

pry(main)> dealership.inventory
#=> [#<Car:0x00007fa53b9ca0a8...>, #<Car:0x00007fccd2985f48...>]

pry(main)> dealership.inventory_count
#=> 2
```

## Iteration 3

Use TDD to update your `Dealership` class so that it responds to the following
interaction pattern:

* A dealership has inventory if it has at least one car.

```ruby
pry(main)> require './lib/car'
#=> true

pry(main)> require './lib/dealership
#=> true

pry(main)> dealership = Dealership.new("Acme Auto", "123 Main Street")
#=> #<Dealership:0x00007fccd30375f8...>

pry(main)> dealership.has_inventory?
#=> false

pry(main)> car_1 = Car.new("Ford Mustang", 1500, 36)
#=> #<Car:0x00007fccd29b5720...>

pry(main)> car_2 = Car.new("Toyota Prius", 1000, 48)
#=> #<Car:0x00007fccd2985f48...>

pry(main)> car_3 = Car.new("Toyota Tercel", 500, 48)
#=> #<Car:0x00007fccd383c2d0...>

pry(main)> car_4 = Car.new("Chevrolet Bronco", 1250, 24)
#=> #<Car:0x00007fccd297dc30...>

pry(main)> dealership.add_car(car_1)

pry(main)> dealership.add_car(car_2)

pry(main)> dealership.add_car(car_3)

pry(main)> dealership.add_car(car_4)

pry(main)> dealership.has_inventory?
#=> true

pry(main)> dealership.cars_by_make("Toyota")
#=> [#<car:0x00007fccd2985f48...>, #<car:0x00007fccd383c2d0...>]

pry(main)> dealership.cars_by_make("Ford")
#=> [#<Car:0x00007fccd29b5720...>]

pry(main)> dealership.total_value
#=> 156000

pry(main)> dealership.details
#=> {"total_value" => 156000, "address" => "123 Main Street"}
```

## Iteration 4

Use TDD to update your `Dealership` class so that it responds to the following
interaction pattern:

* Car price should be from cheapest to most expensive.

```ruby
pry(main)> require './lib/car'
#=> true

pry(main)> require './lib/dealership
#=> true

pry(main)> dealership = Dealership.new("Acme Auto", "123 Main Street")
#=> #<Dealership:0x00007fccd30375f8...>

pry(main)> car_1 = Car.new("Ford Mustang", 1500, 36)
#=> #<Car:0x00007fccd29b5720...>

pry(main)> car_2 = Car.new("Toyota Prius", 1000, 48)
#=> #<Car:0x00007fccd2985f48...>

pry(main)> car_3 = Car.new("Toyota Tercel", 500, 48)
#=> #<Car:0x00007fccd383c2d0...>

pry(main)> car_4 = Car.new("Chevrolet Bronco", 1250, 24)
#=> #<Car:0x00007fccd297dc30...>

pry(main)> dealership.add_car(car_1)

pry(main)> dealership.add_car(car_2)

pry(main)> dealership.add_car(car_3)

pry(main)> dealership.add_car(car_4)

pry(main)> dealership.average_price_of_car
#=> "39,000"

pry(main)> dealership.cars_sorted_by_price
#=> [#<Car:0x00007fccd383c2d0...>, #<Car:0x00007fccd297dc30...>, #<Car:0x00007fccd2985f48...>, #<Car:0x00007fccd29b5720...>]

pry(main)> dealership.inventory_hash
#=> {"Ford"=> [#<Car:0x00007fccd29b5720...>],
"Toyota"=> [#<Car:0x00007fccd2985f48...>, #<Car:0x00007fccd383c2d0...>],
"Chevrolet"=> [#<Car:0x00007fccd297dc30...>]}

```
