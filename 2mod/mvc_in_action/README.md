# MVC in Action
------

## Setup instructions:
```
  - Clone this repo
  - `cd <repo_name>`
  - `bundle install`
  - `rails db:{create,migrate,seed}`
```

## Ruby version:
`2.7.4`

## Rails version:
`5.2.6`


# Overview

This repository is a tool to use in conjunction with the [MVC in Action](https://backend.turing.edu/module2/lessons/mvc_in_action) lesson. There are no tests in this repository but you can use `localhost:3000` to see what is happening. The models, controllers and views have been set up already. We will be focusing on identifying where we are breaking MVC logic conventions and refactoring to follow MVC logic conventions.

Everything in this repository is set up following the below code snippets. Looking at each of these, identify where MVC logic is being broken and work to correct it.

### Models

```ruby
class Comedian < ApplicationRecord
  has_many :specials

  def self.average_age
    "#{average(:age).round(2)} Years"
  end

  def average_special_runtime
    specials.average(:runtime)
  end
end
```

### Views
```erb
<% @comedians.each do |comic| %>
<h4><%= comic.specials.count %> Specials</h4>
<% end %>
```

```erb
<h1><%= @comedian.name %></h1>
<% if @comedian.specials > 2 && @longest_special > 20 %>
  <p>Average runtime of all this comedian's specials: <%= @average_special_runtime %></p>
<% end %>
```

### Controllers
```ruby
class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
    @average_age = Comedian.average(:age)
  end
end
```

```ruby
class ComediansController < ApplicationController
  def show
    @comedian = Comedian.find(params[:id])
    @average_special_runtime = @comedian.average_special_runtime.round(2)
    @longest_special = @comedian.specials.order(runtime: :desc).first
  end
end
```

For additional guidance you can consider the following rules:

* No query logic in your Controllers or Views; this should live in your Models.
* No data formatting in your Models or Controllers; this should live in your Views.
