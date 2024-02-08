# Potluck

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Make sure you have `RSpec` installed globally:
  - `$ gem install rspec`
  - `$ rspec -v`, if installed you should see something like:
  ```rb
    RSpec 3.10
      - rspec-core 3.10.0
      - rspec-expectations 3.10.0
      - rspec-mocks 3.10.0
      - rspec-rails 4.0.1
      - rspec-support 3.10.0
  ```
 - To run the tests: `$ rspec test`. You can also run an individual file: `$ rspec test/FILE.rb` or even a single test: `$ rspec test/dish_spec.rb:LINE NUMBER`
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a `Dish` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/dish'
#=> true

pry(main)> dish = Dish.new("Couscous Salad", :appetizer)
#=> #<Dish:0x00007f93fe9aa698...>

pry(main)> dish.name
#=> "Couscous Salad"

pry(main)> dish.category
#=> :appetizer
```

## Iteration 2

Use TDD to create a `Potluck` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/dish'
#=> true

pry(main)> require './lib/potluck'
#=> true

pry(main)> potluck = Potluck.new("7-13-18")
#=> #<Potluck:0x00007fccc4abe940...>

pry(main)> potluck.date
#=> "7-13-18"

pry(main)> potluck.dishes
#=> []

pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
#=> #<Dish:0x00007fccc4249940...>

pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
#=> #<Dish:0x00007fccc499ceb8...>

pry(main)> potluck.add_dish(couscous_salad)

pry(main)> potluck.add_dish(cocktail_meatballs)

pry(main)> potluck.dishes
#=> [#<Dish:0x00007fccc4249940...>, #<Dish:0x00007fccc499ceb8...>]

pry(main)> potluck.dishes.length
#=> 2
```

## Iteration 3

Use TDD to update your `Potluck` class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/dish'
#=> true

pry(main)> require './lib/potluck'
#=> true

pry(main)> potluck = Potluck.new("7-13-18")
#=> #<Potluck:0x00007f9422838908...>

pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
#=> #<Dish:0x00007f942191e9b8...

pry(main)> summer_pizza = Dish.new("Summer Pizza", :appetizer)
#=> #<Dish:0x00007f9421d26880...>

pry(main)> roast_pork = Dish.new("Roast Pork", :entre)
#=> #<Dish:0x00007f9421d04870...>

pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
#=> #<Dish:0x00007f9421ce6e88...>

pry(main)> candy_salad = Dish.new("Candy Salad", :dessert)
#=> #<Dish:0x00007f9421cb60f8...>

pry(main)> potluck.add_dish(couscous_salad)
#=> [#<Dish:0x00007f942191e9b8...]

pry(main)> potluck.add_dish(summer_pizza)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>]

pry(main)> potluck.add_dish(roast_pork)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>]

pry(main)> potluck.add_dish(cocktail_meatballs)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>]

pry(main)> potluck.add_dish(candy_salad)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>]

pry(main)> potluck.get_all_from_category(:appetizer)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>

pry(main)> potluck.get_all_from_category(:appetizer).first
#=> #<Dish:0x00007f942191e9b8...>

pry(main)> potluck.get_all_from_category(:appetizer).first.name
=> "Couscous Salad"
```

## Iteration 4

Use TDD to update your `Potluck` class so that it responds to the following interaction pattern:

**Note** for the the `menu` method, dishes are sorted alphabetically.

```ruby
pry(main)> require './lib/dish'
#=> true

pry(main)> require './lib/potluck'
#=> true

pry(main)> potluck = Potluck.new("7-13-18")
#=> #<Potluck:0x00007f9422838908...>

pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
#=> #<Dish:0x00007f942191e9b8...

pry(main)> summer_pizza = Dish.new("Summer Pizza", :appetizer)
#=> #<Dish:0x00007f9421d26880...>

pry(main)> roast_pork = Dish.new("Roast Pork", :entre)
#=> #<Dish:0x00007f9421d04870...>

pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
#=> #<Dish:0x00007f9421ce6e88...>

pry(main)> candy_salad = Dish.new("Candy Salad", :dessert)
#=> #<Dish:0x00007f9421cb60f8...>

pry(main)> bean_dip = Dish.new("Bean Dip", :appetizer)
#=> #<Dish:0x00007fa115885500...>

pry(main)> potluck.add_dish(couscous_salad)
#=> [#<Dish:0x00007f942191e9b8...]

pry(main)> potluck.add_dish(summer_pizza)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>]

pry(main)> potluck.add_dish(roast_pork)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>]

pry(main)> potluck.add_dish(cocktail_meatballs)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>]

pry(main)> potluck.add_dish(candy_salad)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>]

pry(main)> potluck.add_dish(bean_dip)
#=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>, #<Dish:0x00007f9421dAA680...>]

pry(main)> potluck.menu
# => {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]}

pry(main)> potluck.ratio(:appetizer)
#=> 50.0
```
