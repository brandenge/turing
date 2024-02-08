# World Cup

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a `Player` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/player'
# => true

pry(main)> player = Player.new({name: "Luka Modric", position: "midfielder"})    
# => #<Player:0x00007fd8273d21e0...>

pry(main)> player.name
# => "Luka Modric"

pry(main)> player.position
# => "midfielder"
```

## Iteration 2

Use TDD to create a `Team` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/team'
# => true

pry(main)> require './lib/player'
# => true

pry(main)> team = Team.new("France")    
# => #<Team:0x00007fe0d0335d48...>

pry(main)> team.country
# => "France"

pry(main)> team.eliminated?
# => false

pry(main)> team.eliminated = true

pry(main)> team.eliminated?
# => true

pry(main)> team.players
# => []

pry(main)> mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
# => #<Player:0x00007fe0d02bd280...>

pry(main)> pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
# => #<Player:0x00007fe0d0851138...>

pry(main)> team.add_player(mbappe)

pry(main)> team.add_player(pogba)    

pry(main)> team.players
# => [#<Player:0x00007fe0d02bd280...>, #<Player:0x00007fe0d0851138...>]

pry(main)> team.players_by_position("midfielder")
# => [#<Player:0x00007fe0d0851138...>]

pry(main)> team.players_by_position("defender")
# => []
```

## Iteration 3

Use TDD to create a `WorldCup` class that responds to the following interaction pattern. For the `active_players_by_position` method, an active player is a player that is on a team that is not eliminated.

```ruby
pry(main)> require './lib/world_cup'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> require './lib/player'
# => true

pry(main)> france = Team.new("France")
# => #<Team:0x00007f936a313698...>

pry(main)> mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})    
# => #<Player:0x00007f936a9168b0...>

pry(main)> pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
# => #<Player:0x00007f936c035eb0...>

pry(main)> france.add_player(mbappe)    

pry(main)> france.add_player(pogba)    

pry(main)> croatia = Team.new("Croatia")    
# => #<Team:0x00007f936a3afea8...>

pry(main)> modric = Player.new({name: "Luka Modric", position: "midfielder"})    
# => #<Player:0x00007f936a3595f8...>

pry(main)> vida = Player.new({name: "Domagoj Vida", position: "defender"})    
# => #<Player:0x00007f936a318f08...>

pry(main)> croatia.add_player(modric)    

pry(main)> croatia.add_player(vida)    

pry(main)> world_cup = WorldCup.new(2018, [france, croatia])    
# => #<WorldCup:0x00007f936a010d10...>

pry(main)> world_cup.year
# => 2018

pry(main)> world_cup.teams
# => [#<Team:0x00007f936a313698...>, #<Team:0x00007f936a3afea8...>]

pry(main)> world_cup.active_players_by_position("midfielder")
# => [#<Player:0x00007f936c035eb0...>, #<Player:0x00007f936a3595f8...>]

pry(main)> croatia.eliminated = true    

pry(main)> world_cup.active_players_by_position("midfielder")
# => [#<Player:0x00007f936c035eb0...>]
```

## Iteration 4

Use TDD to update your WorldCup class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/world_cup'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> require './lib/player'
# => true

pry(main)> france = Team.new("France")
# => #<Team:0x00007f936a313698...>

pry(main)> mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})    
# => #<Player:0x00007f936a9168b0...>

pry(main)> pogba = Player.new({name: "Paul Pogba", position: "midfielder"})    
# => #<Player:0x00007f936c035eb0...>

pry(main)> france.add_player(mbappe)    

pry(main)> france.add_player(pogba)    

pry(main)> croatia = Team.new("Croatia")    
# => #<Team:0x00007f936a3afea8...>

pry(main)> modric = Player.new({name: "Luka Modric", position: "midfielder"})    
# => #<Player:0x00007f936a3595f8...>

pry(main)> vida = Player.new({name: "Domagoj Vida", position: "defender"})    
# => #<Player:0x00007f936a318f08...>

pry(main)> croatia.add_player(modric)    

pry(main)> croatia.add_player(vida)    

pry(main)> world_cup = WorldCup.new(2018, [france, croatia])    
# => #<WorldCup:0x00007f936a010d10...>

world_cup.all_players_by_position
# =>
#   {
#     "forward" => [#<Player:0x00007f936a9168b0...>],
#     "midfielder" => [#<Player:0x00007f936c035eb0...>, #<Player:0x00007f936a3595f8...>],
#     "defender" => [#<Player:0x00007f936a318f08...>]
#   }
```
