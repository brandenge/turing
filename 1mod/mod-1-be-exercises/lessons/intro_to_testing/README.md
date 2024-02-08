<!-- Updated 12/13/2022 -->

# intro_to_testing

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li><a href="#overview">Overview</a></li>
    <li><a href="#learning-goals">Learning Goals</a></li>
    <li><a href="#file-structure">File Structure</a></li>
    <li><a href="#setting-up-rspec">Setting up RSpec</a></li>
    <li><a href="#the-interaction">The Interaction</a></li>
    <li><a href="#writing-a-test">Writing a Test</a></li>
    <li><a href="#Practice">Practice</a></li>
  </ol>
</details>

## Overview

Test Driven Development is a powerful tool used to drive your code. At Turing, TDD will be essential.
RSpec is the testing framework that you will use during your time at Turing.
This repository is used in conjunction with the `intro_to_testing` [lesson](https://backend.turing.edu/module1/lessons/intro_to_testing).

We will work with the files in this order:
 - `interaction/example.md` to reference the interaction pattern used in lesson.
 - `spec/student_spec.rb` to write tests first.
 - `lib/student.rb` to implement the code that the tests expect.

## Learning Goals

- Understand why we use tests
- Understand the stages of a test
- Understand an RSpec test
- Use a variety of assertion methods

<div class="back-to-top-wrapper">
  <a href="#top" class="back-to-top-link" aria-label="Scroll to Top">🔝</a>
</div>

## File Structure

This is how your file tree will be structured.

```
.
├── lib
|   └── name_of_class.rb
└── spec
    └── name_of_class_spec.rb
```

The `lib` directory will hold all of your class files.
  - The lib files will be the name of the class. See above.

The `spec` directory will hold all of your test files.
  - The test files will be the name of the class followed by the word `spec`. See above.

To create a `lib` directory: (from your terminal)
```
mkdir lib
```

To create a `spec` directory: (from your terminal)
```
mkdir spec
```

## Setting up RSpec

This is how  you will install the gem:

```
gem install rspec
```

You will then use the following line of code at the top of each of your `spec` files:

```
require 'rspec'
```

<div class="back-to-top-wrapper">
  <a href="#top" class="back-to-top-link" aria-label="Scroll to Top">🔝</a>
</div>

## The Interaction

In Mod 1 you will learn how to read an interaction pattern. The interaction pattern is a guide for what tests you will be writing and what the expected return value should be. It is in your best interest to follow the interaction pattern as it is given to you and pay attention to the details.

So here is an example of what that might look like.

Example:

```ruby
pry(main)> require './lib/student'
=> true

pry(main)> student = Student.new('Penelope')
=> #<Student:0x007fa71e12c1f0 @cookies=[], @name="Penelope">

pry(main)> student.name
=> "Penelope"

pry(main)> student.cookies
=> []

pry(main)> student.add_cookie('Chocolate Chunk')
pry(main)> student.add_cookie('Snickerdoodle')

pry(main)> student.cookies
=> ["Chocolate Chunk", "Snickerdoodle"]
```

So what is happening? Let's look at the code below:
```ruby
pry(main)> require './lib/student'
=> true
```

- `pry(main)>` this is just referencing what you would see in a `pry` session.
- `require './lib/student'` is showing you what you would include at the top of your `student_spec.rb` file. This would go below the `require 'rspec'`.
  - `=>` is showing you what the return value of the `require './lib/student'` is. This symbol will always reference what the expected return value is.

<div class="back-to-top-wrapper">
  <a href="#top" class="back-to-top-link" aria-label="Scroll to Top">🔝</a>
</div>

## Writing a Test

1. We will working within our `spec` directory.
2. Working with the interaction pattern above, we will be creating a `student`.
3. Here is the basic setup for a test:

```ruby
# student_spec.rb
require 'rspec'
# additional requires will go here

describe Student do

end
```

4. Within the describe there will be individual tests. These tests are initiated with a `it`. Here is what that looks like:

```ruby
it 'the name of method' do

end
```

5. So let's take a look at the the test stages know as S.E.A.T (setup, execution, assertion, teardown):

```ruby
# student_spec.rb
require 'rspec'

describe Student do
  it 'exists' do
    student = Student.new('Penelope') # Setup
    expect(student).to be_a Student # Execution = student, Assertion = Student
  end

  it "#name" do
    student = Student.new('Penelope') #Setup
    expect(student.name).to eq('Penelope') # Execution = student.name Assertion = 'Penelope'
  end
end
```

<div class="back-to-top-wrapper">
  <a href="#top" class="back-to-top-link" aria-label="Scroll to Top">🔝</a>
</div>

## Practice

- [lesson](https://backend.turing.edu/module1/lessons/intro_to_testing)

<div class="back-to-top-wrapper">
  <a href="#top" class="back-to-top-link" aria-label="Scroll to Top">🔝</a>
</div>
