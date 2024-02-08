## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* COMMIT YOUR TESTS FIRST! We will check for TDD via your git history.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

### Iteration 1

Use TDD to create a `Game` and `Contestant` class that respond to the following interaction pattern:
A contestant is considered out of state if their state of residence is not Colorado.

```ruby
pry(main)> require "./lib/contestant"
#=> true

pry(main)> require "./lib/game"
#=> true

pry(main)> pick_4 = Game.new('Pick 4', 2)
#=> #<Game:0x007f96c296b7b0...>

pry(main)> mega_millions = Game.new('Mega Millions', 5, true)
#=> #<Game:0x007f96c2953278...>

pry(main)> mega_millions.name
#=> "Mega Millions"

pry(main)> mega_millions.cost
#=> 5

pry(main)> mega_millions.national_drawing?
#=> true

pry(main)> pick_4.national_drawing?
#=> false

pry(main)> alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
#=> <Contestant:0x007ff87ac0a498...>

pry(main)> alexander.full_name
#=> "Alexander Aigiades"

pry(main)> alexander.age
#=> 28

pry(main)> alexander.state_of_residence
#=> "CO"

pry(main)> alexander.spending_money
#=> 10

pry(main)> alexander.out_of_state?
#=> false

pry(main)> alexander.game_interests
#=> []

pry(main)> alexander.add_game_interest('Mega Millions')
pry(main)> alexander.add_game_interest('Pick 4')

pry(main)> alexander.game_interests
=> ["Mega Millions", "Pick 4"]
```

### Iteration 2

Use TDD to create a ColoradoLottery class that responds to the following interaction pattern.

- A contestant #can_register? if they are interested in the game, 18 years of age or older, and they are either a Colorado resident or this is a national game

```ruby
pry(main)> require "./lib/contestant"
#=> true

pry(main)> require "./lib/game"
#=> true

pry(main)> require "./lib/colorado_lottery"
#=> true

pry(main)> lottery = ColoradoLottery.new
#=> #<ColoradoLottery:0x007f8a3250c440...>

pry(main)> lottery.registered_contestants
#=> {}

pry(main)> lottery.winners
#=> []

pry(main)> lottery.current_contestants
#=> {}

pry(main)> pick_4 = Game.new('Pick 4', 2)
#=> #<Game:0x007f8a317b5e40...>

pry(main)> mega_millions = Game.new('Mega Millions', 5, true)
#=> #<Game:0x007f8a322ad5a0...>

pry(main)> cash_5 = Game.new('Cash 5', 1)
#=> #<Game:0x007f8a32295360...>

pry(main)> alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
#=> #<Contestant:0x007f8a3251c390...>

pry(main)> benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
#=> #<Contestant:0x007f8a30383350...>

pry(main)> frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
#=> #<Contestant:0x007f8a325a6c98...>

pry(main)> winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
#=> #<Contestant:0x007f8a33092c10...>

pry(main)> alexander.add_game_interest('Pick 4')

pry(main)> alexander.add_game_interest('Mega Millions')

pry(main)> frederick.add_game_interest('Mega Millions')

pry(main)> winston.add_game_interest('Cash 5')

pry(main)> winston.add_game_interest('Mega Millions')

pry(main)> benjamin.add_game_interest('Mega Millions')

pry(main)> lottery.interested_and_18?(alexander, pick_4)
#=> true

pry(main)> lottery.interested_and_18?(benjamin, mega_millions)
#=> false

pry(main)> lottery.interested_and_18?(alexander, cash_5)
#=> false

pry(main)> lottery.can_register?(alexander, pick_4)
#=> true

pry(main)> lottery.can_register?(alexander, cash_5)
#=> false

pry(main)> lottery.can_register?(frederick, mega_millions)
#=> true

pry(main)> lottery.can_register?(benjamin, mega_millions)
#=> false

pry(main)> lottery.can_register?(frederick, cash_5)
#=> false
```

### Iteration 3

- We will only register contestants that `#can_register?`
- `#eligible_contestants` is a list of all the contestants who have been registered to play a given game and that have more spending_money than the cost.
- current_contestants are lists of contestant names who have been charged, organized by game.

Method Name                 | Return Value (type)
-----------                 | -------------------
`register_contestant`       | `Contestant`
`eligible_contestants`      | `Array` of `Contestant` objects
`current_contestants`       |`Hash` where the key is a `Game` object and the values is an array of contestant names 


### Iteration 4

- Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
- All of the setup remains the same, make sure you have registered and charged contestants for all of the games.
- The #draw_winners method returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants
- Because the array for #winners will be populated randomly, we cannot guarantee its contents, but we can guarantee that it will be an array of hashes that is the same length as the number of games we have. An example, based on our setup, the return value could be:

<code>
[{"Winston Churchill"=>"Cash 5"},
{"Frederick Douglass"=>"Mega Millions"},
{"Grace Hopper"=>"Pick 4"}]
</code>

- To test the #announce_winner method, you will need to stub the return value of #winners.
