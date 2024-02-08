# Futbol Spec Harness

## Setup

First, make sure that you have a directory called `futbol` that contains all the code for you project. For example, inside the `futbol` directory should be `lib`, `spec`, and `data` directories. The spelling must be exactly `futbol`.

Navigate to the directory where `futbol` is located and clone this repository. Make sure you not *inside* the `futbol` directory, but rather adjacent to it, i.e. if you enter `ls` you should see `futbol` listed.

After you clone, the directory structure should look like this:

  ```
    <some_directory>
    |
    |\
    | \<futbol>
    |
    |\
    | \<futbol_spec_harness>
  ```

Change into the `futbol_spec_harness` directory and run `bundle` from the command line. If you get an error that says the bundle command cannot be found, run `gem install bundle` from the command line and try again.

## Usage

From the `futbol_spec_harness` directory, in the command line run `bundle exec rspec`. This will run a test suite for the `StatTracker` class as described in the project page.

In order for the test suite to run, all requirement statements inside your project's `lib` directory need to be `require_relative` rather than `require`. For example, if in your `stat_tracker.rb` file you have a line:

```ruby
require './lib/helper_class'
```

You should change it to use a `require_relative`:

```ruby
require_relative './helper_class'
```

You do not need to change any of the require statements inside your `spec` directory.
