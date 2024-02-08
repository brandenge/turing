# Cabot Cove College

This Rails application is intended to be used as an opportunity for students to measure their own learning from week 2 of module 2 of the back-end program of the Turing School of Software & Design.

Fork this repository and clone your newly created repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `bundle update`
  - `rake db:{drop,create,migrate,seed}`
---

### Requirements

* TDD all new work; any model METHODS you write must be fully tested.
---
### Not Required

* No form input is required or expected
* No visual styling is required or expected
---
### Before Starting User Stories

* This challenge uses a many-to-many table (your migrations are already built!), be sure to check your setup/schema carefully.
* You will have 10 failing model tests (Let your instructor know if you are not seeing 10 failing tests)
* Get these 10 tests to pass before moving on to the user stories below.

---

## User Stories
The residents of Cabot Cove, Maine are tired of the rampant crime in their sleepy little village, and are enrolling in the local college to learn self-defense and general law enforcement. 

Our job is to help Cabot Cove College keep track of all the residents and the courses in which they are enrolled. 


```
User Story 1 of 4

As a visitor,
When I visit '/residents',
I see a list of residents with the following information:
- Name
- Age
- Occupation
(e.g. "Name: Jessica Fletcher, Age: 65, Occupation: Mystery writer", 
      "Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")
```

```
User Story 2 of 4

As a visitor,
When I visit '/residents/:id'
I see this resident's name
And I see a list of this resident's courses.

(e.g. "Jessica Fletcher
      Courses:
            - Crime Scenes 101"
            - Fingerprinting")
```

```
User Story 3 of 4
As a visitor,
When I visit '/courses'
I see a list of courses and the number of residents enrolled in each course.

(e.g. "Crime Scenes 101: 5"
      "Fingerprinting: 10")
```

```
User Story 4 of 4

As a visitor,
When I visit '/residents'
I see the average age of all residents.

(e.g. "Average Age: 72.5")
```
---
### Extension
```
User Story Extension

Residents index page shows residents in alphabetical order.
Courses index page shows courses in alphabetical order.
And the courses index page also shows residents per course in alphabetical order.

(e.g. "Fingerprinting: 3"
      "- Jessica Fletcher"  
      "- Amos Tupper"
      "- Dr. Seth Hazlitt"
      )
```
