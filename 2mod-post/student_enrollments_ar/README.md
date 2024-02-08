# Student Enrollments
## Complex Queries

This repository is a reworking of the [Complex Queries workshop](https://backend.turing.edu/module2/misc/complex_queries) that can be completed as SQL-only; this repository will ask the same questions but should be completed using ActiveRecord and models. 

RSpec, Shoulda-Matchers, and SimpleCov have been set up for you. 

This repository has been tested with Ruby 2.7.4 and Rails 5.2.8. 

## Setup
1. `bundle install`
1. `rails db:{drop,create}`

You will need to create all migrations. 

## Instructions
We are creating an application to track student enrollments in our school. To do this, we'll need to track `Students`, `Courses`, `Teachers`, and `Enrollments`. 

Students have a name. 
Teachers have a name and room_number.
Courses have a name and teacher_id. 
Enrollments have a student_id, class_id, and a grade (integer). 

Courses have one Teacher. 
Students can be enrolled in many Courses. 
Courses have many Students. (The join table in this case can be called "enrollments".) 

## Data Setup
- First, write migrations to fulfill the above model descriptions. 
- Then, write model tests to set up associations between each model. Make sure your model tests are always at 100% coverage. 


## User Stories
Note: these user stories are focused on writing AR queries. If you're still working on writing efficient AR, try writing in SQL first, then translate them to AR as you go. Remember to write model tests to prove the queries work correctly!


```
1. Student Show Page

As a user
When I visit a Student show page (/student/:id)
I see the name of the student
And I see the names of all Courses that this student enrolled in
As well as a numeric count of the number of Courses the student is currently enrolled in
And I see the average grade across all classes that this student is enrolled in. 
```

```
2. Teacher Index Page

As a user
When I visit the Teachers index page (/teachers)
I see a list of all teachers and their room number
And underneath each teacher's name I see a list of the students that are enrolled in their classes
And each student's name is a link to their specific show page. 
```

```
3. Student Show Page

As a user
When I visit a student show page (/student/:id)
At the bottom of the page I see a list of all teachers that this student has, based on class enrollment. 
```

```
4. Class Show Page

As a user
When I visit a class show page (/class/:id)
I see the average student grade for this class
And I see the names of all students whose grade is lower than the average for this class
And next to the students' names, I see their average grade for this class. 

(Ex: 
Average grade: 82.5
   Students below this average: 
      - John Smith: 81
      - Sally Field: 79
)
```



### Extensions
1. Refactor any queries used in user stories to only one query per story. 

(Under construction)
