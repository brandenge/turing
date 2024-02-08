# Reaching Through Objects

## Introduction
By now, you've learned that objects can represent real-life things. Objects can have properties & behaviors that can both use and affect other objects. Chaining together multiple objects is commonplace in object-oriented design, but the implementation can be tricky!

Use the exercises in this repository to explore the relationships between objects, and practice building solutions for real-life applications, while using best practices like Test-Driven Development.

Your solution to each prompt in each scenario should start with a test. You get to decide HOW the solution will be built - but keep in mind it should work for what the prompt says.

* Note: These scenarios are listed in the suggested order of completion, but you can go in any order you like.

### Scenario 1: Card Games
Create `Card`,  `Deck`, and `Player` objects to represent a deck of playing cards!
1. A `Card` has a suit (diamonds, hearts, clubs, spades) and a `value` (A-K-Q-J, 10-2), as well as a way to read those data points.
1. A `Deck` has at least 5 `Card`s, and can pull a `random_card` out of itself.
1. A `Player` has up to 8 cards in its `hand`, and can list the cards in their hand in order of value descending (e.g. `A of Diamonds, J of Hearts, 7 of Spades, 3 of Clubs`)

### Scenario 2: Cookie Jar
Who stole the cookies from the cookie jar? Using classes for `Cookie`, `Jar`, and `Person`, write a TDD solution that encompasses this functionality.
1. A `Cookie` has a `type` attribute, and a way to read that data.
1. A `Jar` has a `maximum_capacity`, a `current_num_cookies`, and ways to read that data.
1. A `Person` can `add_cookie` to a `Jar` instance. A `Person` can also `steal_cookie` from the `Jar`.
1. Write a method that can tell how many `Cookies` a `Person` stole from the `Jar`.
1. A `Person` should also be able to tell us the `type`s of `Cookies` they ate from the `Jar`. 

- Can you come up with more properties for each class? How does that property interact with the other classes?

### Scenario 3: Farmburgh
You own a farm! On your farm are a few different crops, across many multiple fields. Each crop grows a plant with specific properties, like the best season to grow, if it needs watered, or if its soil has been fertilized. Your job as the farmer is to plant, grow, harvest, and overall manage the farm. Write a TDD solution that encompasses the above functionality, using separate classes for `Plant`, `Field`, `Crop`, and `Farm`.
1. A `Plant` has a name, and growing season, and a way to read both of those attributes.
1. A `Field` can have 1 `Plant` at a time, and a way to read that data.
1. A `Crop` could be planted across many `Fields`, but should only be 1 `Plant` at a time. (I.e., a wheat farm may have 10 fields, but only plants their wheat crop on 5 of those fields. The other 5 are for sugar, or vegetables.)
1. A `Farm` has a name, and way to read that data. The `Farm` should also be able to list all `Plants` currently on their farm.


### Scenario 4: Sportsball League
It's time to make it into the big leagues, and to make a big league. Your company is starting a Sportsball League, and as the resident developer it's your job to make sure they do it right. Using classes for `Player`, `Roster`, `Team`, and `League`, write a solution that uses TDD to solve this problem.
1. A `Player` has a `name` and a `position`, as well as a way to read that data.
1. A `Roster` can hold a list of up to 10 players. The `Roster` should be able to list all players by position.
1. A `Team` can list all its players, and also has a `manager_name` and a way to read that data. `Teams` can also be part of only 1 league at a time.
1. A `League` can list all `Teams` currently in the league. It should also be able to list all its players alphabetically by first name.

### Scenario 5: Hotel it on the Mountain
You own a line of luxurious ski resorts and hotels. You need to be able to keep track of every aspect of the booking process at each hotel, including the ability for guests to make a reservation for a specific date range, as well as which rooms are available at each hotel.
Using classes for `Hotel`, `Reservation`, `Room`, and `Guest`, write a TDD solution that encompasses this functionality.
1. A `Guest` has a `name`, as well as a way to read that data.
1. A `Room` can accomodate up to 2 `Guests`.
1. A `Reservation` has at least 1 `Room`. A `Reservation` should also be able able to tell you the name of each `Guest` that is staying in their `Room` currently.
1. A `Hotel` can has a maximum of 10 `Rooms`. The hotel should be able to list the names of all `Guests` currently staying at the hotel. A hotel should also be able to state the remaining number of guests it can accept reservations from (`maximum_guests - current_guests` e.g. `"This hotel can accomodate 4 more guests."`).

### Scenario 6: Shopping Cart
Your local grocery chain has lots of products, lots of shopping carts, and lots of stores in the surrounding area. You've been hired to keep track of each product & shopping cart in each store, and make sure the carts don't get overfilled. Using classes for `Product`, `ShoppingCart`, `Guest`, and `Store`, write a solution using TDD that encompasses this functionality.

1. Each `Product` has a name, unit price, and quantity.
1. Each `ShoppingCart` has a `capacity` of no more than 5 `Product`s.
  - Do you think it is important to be able to tell if a shopping cart is full or empty? How would that be represented?
  - The `ShoppingCart` should be able to list out the names of each of its products.
  - The `ShoppingCart` should also be able to calculate the subtotal of all its products.
1. Each `Store` has a place to store its `ShoppingCart`s and `Product`s.
1. Each `Store` should only allow up to 5 `Guest`s at a time (it's _very_ premium).
  - A `Store` needs the ability to bill each `Guest` according to the `Products` in their `ShoppingCart`. What is the sum total of all the `Store`'s `Guests` `ShoppingCart`s?
