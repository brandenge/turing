# socials Directory

## Contents
```
Classes:
./lib/photo.rb
./lib/status.rb
./lib/commentable.rb (Empty file)

Tests:
./spec/photo_spec.rb
./spec/status_spec.rb
```

## Running Tests

* Navigate to this directory
* run `rspec`
* You should have 12 passing tests

## Exercise
  1. Extract any duplicated code into the `Commentable` module which we’ll include within each class.
    * Oftentimes, you’ll see modules named with the convention “-able”, like `Comparable` or `Enumerable`.

  1. To get access to the methods defined in the module, include the module at the beginning of the class.
    * Using `include` allows you to call the module methods on an instance of the class where it is included.

  1. Run the tests to check if the classes still work after your refactors

## Questions
  1. What is similar/different between the two main classes?
  2. What design principle(s) are we breaking? Prepare to explain.
  3. How might we use mixins to make our code better?
