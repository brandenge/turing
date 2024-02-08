<!-- Updated 12/13/2022 -->
# Event Manager

## Group Exercise

### Part I
Create an `Attendee` class that passes the tests in the spec file with the following methods:
  1. `initialize`: arguments should include the attendee's ID number, first name, last name, and ZIP code
  1. `display`: displays the ID number, full name, and ZIP code of the attendee in the following format:
    `17: Shannon Davis, 98122`
  1. `clean_zip`: ensures the ZIP code is a five-digit number; e.g. `12345`. A ZIP code that is:

  * longer than five digits should be truncated to five digits; e.g. `'1234567'` -> `'12345'`
  * shorter than five digits should be prepended with leading zeroes; e.g. `'123'` -> `'00123'`
  * missing or non-existent ZIP code should be replaced with a default value; e.g. `nil` -> `'00000'`

### Part II

Create an `EventManager` class that performs the following tasks:

 * reads file contents and accesses columns by name using the CSV Library
 * creates an array of `Attendee` objects as specified in **Part I**
 * displays each `Attendee` as specified in **Part I**
