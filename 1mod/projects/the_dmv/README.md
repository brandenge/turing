# The DMV

This is the starter repo for the BE Mod1 DMV project.

## Process

I look at code bases as a series of levels of abstraction. And so in reviewing them, I start from the highest level and move downwards. These levels of abstraction are roughly as follows from highest to lowest:

1) File structure
2) Files, Modules, and Classes
3) Method signatures
4) Individual lines of code in methods

How deep into these levels of abstraction depends on the size of the code base. This code base was rather small, so I was able to cover everything in the first 3 abstractions, but only skimmed lines of code. In a larger code base, I would likely only try to identify the most relevant part of the code base for me at that time and only try to understand that part of it.

How long I spend reviewing a code base in this manner is dependant on several factors, such as its size, how familiar I am with the language, tools, and type of application it is. Also how risky it is to start changing things in it, my attention span, and my general feeling for how productive I feel further time spent reviewing in this manner will be. The primary purpose of reviewing a code base is to efficiently be able to start getting hands on the code and start changing it. Once I am able to start tinkering with the code to further my understanding, then that method starts to take precedence over all other methods of review.

## Challenges

Knowing where to begin was one challenge. Ideally, I would start at the highest abstractions of the code, such as higher-order classes and methods. However, without any guidance from someone who is already familiar with the code base, it is impossible to know what these are, or what the ideal order to review the code is. So one of the first things I try to get a sense of is these levels of abstraction, their order, and how they fit together.

Another challenge is not being able to understand certain parts of the code base. For example, in the instance of this code base, I am not familiar with the `faraday` gem and what it is doing in the `DmvDataService` class. My best guess is only that it is handling API calls for us and returning JSON data from the responses.

Finally are stylistic differences between myself and other authors of code. I have to start getting familiar with others style for writing code.

## Other Takeaways

Nothing was easier than I expected to be, but I expected it to be relatively easy. Any difficult I had in debugging felt like it had more to do with just being a bit rusty with debugging rather than due to any unfamiliarity with the code base or it being someone else's code.

The easy part of reviewing this code base was its size, and mostly familiar code. The size of it is still rather small, which means I was able to pretty much wrap my head around the entire program, rather than having to break it up into pieces.

Another easy part was my familiarity with Ruby code and RSpec by now. The only part I am not familiar with was the `faraday` gem in the `DMVDataService` class. None of the code here is terribly difficult or tricky.
