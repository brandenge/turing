# Event Manager

Turing Backend Module 1: [Lesson Link](https://backend.turing.edu/module1/projects/eventmanager)

## Prerequisites
Before starting this tutorial, you should be comfortable with:

 * the topics covered in [Ruby in 100 Minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html)
 * installing a gem
 * using `pry` (or `IRB`)
 * writing methods

## Learning Goals
After completing this tutorial, you will be able to:

 * manipulate [file](http://rubydoc.info/stdlib/core/File) input and output
 * read content from a [CSV](http://rubydoc.info/stdlib/csv/file/README.rdoc) (Comma Separated Value) file
 * transform it into a standardized format
 * manipulate [strings](http://rubydoc.info/stdlib/core/String)

For this project, two data files have been saved to the `data` directory:

 * `event_attendees.csv`: small sample data file (~20 lines)
 * `full_event_attendees.csv`: large sample data file (5,000+ lines)

## Iteration 0: Loading a File
 * Read the File Contents
 * Read the File Line By Line
 * Display the First Name of All Attendees
 * Skipping the Header Row
 * Look for a Solution before Building a Solution

## Iteration 1: Parsing with CSV
 * Switching over to use the CSV Library
 * Accessing Columns by their Names
 * Displaying the Zip Codes of All Attendees

## Iteration 2: Cleaning up our Zip Codes
 * Pseudocode for Cleaning Zip Codes
 * Handling Bad and Good Zip Codes
 * Handling Missing Zip Codes
 * Moving Clean Zip Codes to a Method
 * Refactoring Clean Zip Codes
