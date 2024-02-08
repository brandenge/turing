# vehicles Directory

## Contents
```
Classes:
./lib/camry.rb
./lib/jeep.rb
./lib/airconditionable.rb (Empty file)
./lib/engine.rb (Empty file)

Tests:
./spec/camry_spec.rb
./spec/jeep_spec.rb
```

## Running Tests

* Navigate to this directory
* run `rspec`
* You should have 8 passing tests

## Exercise
* Create an `Engine` module to extract the `start` and `stop` methods. (Yes, we know this isn’t following the "-able" naming conventions, but this is not a rule).
* Create an `Airconditionable` module that is mixed into both classes. Instances of either class should be able to:
  * turn the AC on and display **"Chilly air coming your way!"**
  * turn the AC off and display **"Temp is fine in here."**
  * It’s up to you what you want to name these methods.
  * Write tests for these methods in both camry and jeep specs.

* Now that `stop` and `start` are extracted to the module, add back in a `start` or `stop` method in one of your class. Have it return the string **"WAIIIIIIIT"**.
* What happens when you run this method? Why?

## Summary
* Can you create a `Vehicle` module that holds both engine and AC functionality?
  * Should you?
* What might the benefits of separating Engine and AC functionality into different modules?
