# Denver Public Library (DPL)

## Preparation

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!

## Iteration 1

Use TDD to create a `Book` class that responds to the following interaction pattern. For the `publication_year` method, assume that the year is always the last four characters of the publication date.

```ruby
pry(main)> require './lib/book'
#=> true

pry(main)> book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
#=> #<Book:0x00007fcc021fad08...>

pry(main)> book.title
#=> "To Kill a Mockingbird"

pry(main)> book.author
#=> "Harper Lee"

pry(main)> book.publication_year
#=> "1960"
```

## Iteration 2

Use TDD to create an `Author` class that responds to the following interaction pattern.

The `write` method must take two Strings as arguments and return an instance of `Book`.

```ruby
pry(main)> require './lib/book'
#=> true

pry(main)> require './lib/author'
#=> true

pry(main)> charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
#=> #<Author:0x00007fb898081850...>

pry(main)> charlotte_bronte.name
#=> "Charlotte Bronte"

pry(main)> charlotte_bronte.books
#=> []

pry(main)> jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
#=> #<Book:0x00007fb896e22538...>

pry(main)> jane_eyre.class
#=> Book

pry(main)> jane_eyre.title
#=> "Jane Eyre"

pry(main)> villette = charlotte_bronte.write("Villette", "1853")
#=> #<Book:0x00007fb8980aaca0...>

pry(main)> charlotte_bronte.books
#=> [#<Book:0x00007fb896e22538...>, #<Book:0x00007fb8980aaca0...>]
```

## Iteration 3

Use TDD to implement the following features:

1. Create a `Library` class. Each library has a `name` as well as a way to read that data.
2. Each library has a list of `books` and `authors` as well as a way to read that data
3. Each library can `add_author` which will store the author to the library's list of `authors` as well as storing any books that author has written to the library's list of `books`
4. Each library can tell us the `publication_time_frame_for` an author which takes an `Author` object as an argument and returns a hash with two key/value pairs:
  * `:start` which points to the publication year of the `Author`'s first book.
  * `:end` which points to the publication year of the `Author`'s last book.


Method Name                 | Return Value (type)
-----------                 | -------------------
`name`                      | `String`
`books`                     | `Array` of `Book` objects
`authors`                   | `Array` of `Author` objects
`add_author(author)`        | `authors` (`Array` of `Author` objects)
`publication_time_frame_for(author)`         | `Hash` with two key/value pairs: `:start` which points to the publication year of the `Author`'s first book and `:end` which points to the publication year of the `Author`'s last book.

## Iteration 4

Use TDD to implement the following features on the `Library` class:

* Checking out a book and the ability to return a list of all books currently checked out

* Returning a book. Calling this method means that a book is no longer checked out.

* Finding the book that has been checked out the most times from this library

