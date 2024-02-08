# Inheritance

## Lesson Example
We've been contracted to create an Employee Management program for ABC Company. We know there are lots of different *types* of employees, but to start with we'll use `Ceo`, `Manager`, and `Intern`. One developer took it up on themselves to start setting up those models. However, we want to be as efficient as possible and share these attributes between classes, since there will likely be even more added, like `PartTime`, `Operations`, etc. Your job is to make the existing codebase more efficient and structured according to the rules of Inheritance.


## Instructions
Run `ruby runner.rb` from the root of this folder (`lesson_example`). A `pry` breakpoint has been provided for you.

Using TDD (and following the rules of inheritance), give each class (`Ceo`, `Manager`, and `Intern`) the ability to have readable `name` and `id` attributes, as well as the ability to access the `total_compensation` method. There is a `describe` block already set up in the respective classes where you can write your tests before your code.

To confirm that you've implemented inheritance correctly, run `rspec spec` both *before* and *after* implementing inheritance. The existing tests *will need to change* during your refactoring!  But, if everything went well, your tests should pass both before and after the refactoring takes place.
