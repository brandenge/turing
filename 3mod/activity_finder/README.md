# Activity Finder 

## Set up

1. Clone this repo 
2. `cd activity_finder`
3. `bundle install`
4. `rails db:create`
5. `rails s`

When you run your server and navigate to `localhost:3000`, you should be on a landing page where you see instructions to search for things to do. 

Use the [Bored API](https://www.boredapi.com) to complete the following user story:

Happy Path: 
```
As a visitor
When I visit '/'
And insert the number of participants I want an activity for
And click on the button to Find Something To Do
I'm taken to '/activity'
Where I see a description of the suggested activity, 
the number of participants for the activity,
and a visual of how pricey that activity would be (see more info on this below)
```

Sad Path:

```
As a visitor
When I visit '/'
And insert a number of participants that doesn't return any activities from the API,
And click on the button to Find Something To Do
I'm redirected back to the landing page
Where I see a flash message telling me that there are no activities for that number of participants
```

Consider this scale to create a visual:
* 0 >= price >= 0.33 ---- "$"
* 0.34 >= price >= 0.67 ---- "$$"
* 0.68 >= price >= 1 ---- "$$$"



