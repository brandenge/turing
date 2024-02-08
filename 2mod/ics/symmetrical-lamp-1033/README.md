# Supermarket Sweep

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**
* The use of scaffolding is not permitted on this assessment. 

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* Model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Challenge Description

Supermarket Sweep is an app that tracks Supermarkets, the customers that they serve and the items that those customers purchase. 



* Supermarkets have a name and a location.
  * ex: name: 'Corner Market', location: '123 Food St.'
* Customers have a name.
  * ex: name: 'Sally Shopper'
* Items have a name and a price
  * ex: name: 'Banana', price: 1 (this can be interpreted as $1. For simiplicity, we recommend storing price as an integer)

## Model Setup
* Supermarkets have many Items. 
* Items belong to a Supermarket.
* Customers have many Items.
* Items have many Customers.

Some of the initial model set up and testing has been done for you. 

## User Stories

```
Story 1

As a visitor, 
When I visit a customer show page,
I see the customer's name,
And I see its a list of its items
including the item's name, price, and the name of the supermarket that it belongs to.
```

```
Story 2

As a visitor,
When I visit a customer's show page,
Then I see a form to add an item to this customer.
When I fill in a field with the id of an existing item,
And I click submit,
Then I am redirected back to the customer's show page, 
And I see the item now listed under this customer's items.
(You do not have to test for a sad path, for example if the ID submitted is not an existing item)
```

```
Story 3

As a visitor,
When I visit the items index page,
Then I see a list of all items
including the item's name, price, and the name of the supermarket that it belongs to
and the count of customers that bought that item.
```

## Extensions

```
Extension

As a visitor,
When I visit a supermarket's show page,
Then I see a unique list of all customers that have shopped at the supermarket.
```
