# Museo

## Setup

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!

### Iteration 1

```markdown
There are **3** points possible in Iteration 1:

1.  Artist Creation (must include all attributes)
2.  Photograph Creation (must include all attributes)
3.  Artist #age_at_death
```

Use TDD to create a `Photograph` and an `Artist` class that respond to the following interaction pattern.

For `age_at_death`, assume an artist was born and died on the same day.

```ruby
pry(main)> require './lib/photograph'
#=> true

pry(main)> require './lib/artist'
#=> true

pry(main)> attributes = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: "4",
  year: "1954"
}      

pry(main)> photograph = Photograph.new(attributes)
#=> #<Photograph:0x00007fc2d1050c80...>

pry(main)> photograph.id
#=> "1"

pry(main)> photograph.name
#=> "Rue Mouffetard, Paris (Boy with Bottles)"

pry(main)> photograph.artist_id
#=> "4"

pry(main)> photograph.year
#=> "1954"

pry(main)> attributes = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
}

pry(main)> artist = Artist.new(attributes)
#=> #<Artist:0x00007fc2d0a6c080...>

pry(main)> artist.id
#=> "2"

pry(main)> artist.name
#=> "Ansel Adams"

pry(main)> artist.born
#=> "1902"

pry(main)> artist.died
#=> "1984"

pry(main)> artist.country
#=> "United States"

pry(main)> artist.age_at_death
#=> 82
```

### Iteration 2

```markdown
There are **3** points possible in Iteration 2:

4. Curator Creation (must include all attributes)
5. Curator #add_photograph & Curator #add_artist
6. Curator #find_artist_by_id
```

Use TDD to create a `Curator` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/photograph'
# => true

pry(main)> require './lib/artist'
# => true

pry(main)> require './lib/curator'
# => true

pry(main)> curator = Curator.new    
# => #<Curator:0x00007fb3d9111cc0...>

pry(main)> curator.photographs
# => []

pry(main)> photo_1 = Photograph.new({
     id: "1",      
     name: "Rue Mouffetard, Paris (Boy with Bottles)",      
     artist_id: "1",      
     year: "1954"      
})        
# => #<Photograph:0x00007fb3d8ea1cd8...>

pry(main)> photo_2 = Photograph.new({
     id: "2",      
     name: "Moonrise, Hernandez",      
     artist_id: "2",      
     year: "1941"      
})        
# => #<Photograph:0x00007fb3d8e0bfa8...>

pry(main)> curator.add_photograph(photo_1)

pry(main)> curator.add_photograph(photo_2)

pry(main)> curator.photographs
# => [#<Photograph:0x00007fb3d8ea1cd8...>, #<Photograph:0x00007fb3d8e0bfa8...>]

pry(main)> curator.artists
# => []

pry(main)> artist_1 = Artist.new({
    id: "1",      
    name: "Henri Cartier-Bresson",      
    born: "1908",      
    died: "2004",      
    country: "France"      
})        
# => #<Artist:0x00007fb3d8b4ed60...>

pry(main)> artist_2 = Artist.new({
    id: "2",      
    name: "Ansel Adams",      
    born: "1902",      
    died: "1984",      
    country: "United States"      
})        
# => #<Artist:0x00007fb3d90bb4b0...>

pry(main)> curator.add_artist(artist_1)

pry(main)> curator.add_artist(artist_2)

pry(main)> curator.artists
# => [#<Artist:0x00007fb3d8b4ed60...>, #<Artist:0x00007fb3d90bb4b0...>]

pry(main)> curator.find_artist_by_id("1")
# => #<Artist:0x00007fb3d8b4ed60...>
```

### Iteration 3


Use TDD to update your `Curator` class so that is supports the following methods:

* A `Curator` can return a list of all artists and their photographs.
* A `Curator` can return a list of names of artists who have more than one photograph
* A `Curator` can return a list of `Photograph`s that were taken by a photographer from that country.


### Iteration 4

Use TDD to add the following methods to your `Curator` class:

* Each `Curator` can take a path to a CSV file containing photographs and adds them to the `Curator`. You may find the included `FileIO` class useful.
* Each `Curator` can takes a range and returns an list of all photographs with a year that falls in that range.
* Each `Curator` can tell us a given `Artist`'s age when a photograph was taken and all the photographs they took at that age. 

