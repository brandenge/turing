# Make It Work

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

### Before Starting User Stories

* This challenge uses a one-to-many and a many-to-many relationship (your migrations are already built), be sure to check your setup/schema carefully.
* You also are starting with seeds, so if you need any objects for your tests, feel free to grab the ones from the seeds file.
* All model tests for validations and relationships have been made.
* You will have 6 failing model tests as soon as you set up this challenge and run your tests (Let your instructor know if you are not seeing 6 failing tests)
* Get these tests to pass before moving on to the user stories below.

### Challenge Description

Project Runway! During a short period of time, contestants are given a challenge to create projects (outfits). Challenges have themes (For example: Recycled Material, Bridal Wear). Projects have a name and a material that is used. Contestants have a name, age, hometown, and years of experience. Challenges have many projects, projects belong to a challenge. Projects can have multiple contestants working on them, and contestants can work on different projects throughout the show.

---

## User Stories


```
User Story 1 of 3

As a visitor,
When I visit a project's show page ("/projects/:id"),
I see that project's name and material
And I also see the theme of the challenge that this project belongs to.
(e.g.    Litfit
    Material: Lamp Shade
  Challenge Theme: Apartment Furnishings)


```

```
User Story 2 of 3

As a visitor,
When I visit the contestants index page ("/contestants")
I see a list of names of all the contestants
And under each contestants name I see a list of the projects (names) that they've been on

(e.g.   Kentaro Kameyama
        Projects: Litfit, Rug Tuxedo

        Jay McCarroll
        Projects: LeatherFeather)
```

```
User Story 3 of 3
As a visitor,
When I visit a project's show page
I see a count of the number of contestants on this project

(e.g.    Litfit
    Material: Lamp Shade
  Challenge Theme: Apartment Furnishings
  Number of Contestants: 3 )
```

---

### Extensions
```
User Story Extension 1 - Average years of experience for contestants by project

As a visitor,
When I visit a project's show page
I see the average years of experience for the contestants that worked on that project
(e.g.    Litfit
    Material: Lamp Shade
  Challenge Theme: Apartment Furnishings
  Number of Contestants: 3
  Average Contestant Experience: 10.25 years)
```

```
User Story Extension 2 - Adding a contestant to a project

As a visitor,
When I visit a project's show page
I see a form to add a contestant to this project
When I fill out a field with an existing contestants id
And hit "Add Contestant To Project"
I'm taken back to the project's show page
And I see that the number of contestants has increased by 1
And when I visit the contestants index page
I see that project listed under that contestant's name
```

