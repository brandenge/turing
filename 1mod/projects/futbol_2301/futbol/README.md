# Futbol

## About

This application performs statistical analysis on sports data from a football league. The data is provided in 3 CSV files, which are parsed, structured, and stored in memory. A list of methods are provided on the `StatTracker` class for returning various sport statistics about the games, teams, and seasons from the league.

## Built With

- ruby 2.7.2p137 (2020-10-01 revision 5445e04352)
- RSpec 3.12
  - rspec-core 3.12.1
  - rspec-expectations 3.12.2
  - rspec-mocks 3.12.3
  - rspec-support 3.12.0

## Getting Started

1) Open your terminal and navigate to the directory you would like to clone the repository into.
2) Type the command `git clone git@github.com:brandenge/futbol.git` to clone the repository at [https://github.com/brandenge/futbol](https://github.com/brandenge/futbol).
3) Type `cd futbol` to navigate into the project's root directory.
4) Run the `rspec` command to see all of the Rspec tests run and ensure the program is running properly.
5) Open the file at `./lib/stat_tracker.rb` to see the list of methods available to return various sport statistics on the data.
6) Open the file at `runner.rb`
7) Call methods on the provided instance of the `StatTracker` class to return the desired statistical information on the sports data.
8) Run the `runner.rb` file to output the desired statistical information.

## Testing

- To run the tests, run the `rspec` command from the project's root directory.
- Tests are organized by the `StatTracker`, `League`, `Team`, `Season`, and `Game` classes.
- `StatTracker` has all of the methods and helper methods associated with statistical analysis.
- `League` instantiates objects of `Team`, `Season`, and `Game` to store all of the relevant data.
- Unit tests are provided on all helper methods.
- Integration tests are provided on all higher-order methods.
- These tests ensure that the statistical information being provided is correct.
- A sample of the full data set is provided within the `spec/fixtures/` directory.
- Note that running the full test suite on the entire data set should take about 10-15 seconds to run.

## Process Summary

1) Team meeting to establish working relationship, expectations, communication, and workflow as a group
2) Project planning on GitHub Projects
3) Collaboration on project design using Figma, outlining class hierarchies for data flow
   a) Create a mapping of the CSV data to each class
   b) Create a specification of each class' attributes to structure the data
4) Repository setup
   a) GitHub setup
   b) Initial files and folder structure setup
   c) `simplecov` gem installation for test suite coverage
   d) Spec harness setup for additional test suite coverage
   e) Runner file setup
5) CSV parsing
6) Data storage and initial tests setup
7) Design refactor
8) Statistical methods for `Game`, `League`, and `Season` data
9) Team retrospective meeting
10) Finish README
11) Refactor for methods and tests
12) Statistical methods for `Team` data
13) Final refactor
14) Final retrospective

## Project Planning

### Check-ins

Our team agreed to conduct multiple daily checkins each working day. We did one check-in via Slack in the morning before class started with an update about any blockers and what we think we will be working on for the day. Another check-in in the middle of the day done live in Zoom at our first opportunity to meet together. And a final check-in also via Slack in the evening near the end of the day, with another update about any blockers and what we got done. On the weekends these were more optional and only done individually for those that were working that day.

### Project Organization and Workflow

Two main tools we quickly opted to utilize were a GitHub project board for project management, and also a Figma whiteboard for design planning.

- [GitHub Project Board](https://github.com/users/brandenge/projects/4/views/1)
- [Figma Whiteboard](https://www.figma.com/file/1laLZnGdabPuaQSom9U1w0/2301-Mod-1-Futbol-Group-Project?node-id=0%3A1&t=V7CetcSUBmS10oWo-0)

In our initial team meeting, we discussed further project organization and workflow details, such as:
  - PR approval process
  - Standardized team practices, such as how to name and manage our respective feature branches, frequent pulling, and communication
  - Each team member's strengths, weaknesses, and role in the team

### Approaches

Our group did not have strong opinions about the project organization and workflow. We did take a moment for brainstorm other possible options, such as different project management or whiteboarding tools, such as Trello, Miro, and InVision. We chose to use the GitHub project board to get some experience with another tool as we had all used Trello previously. And we opted to use Figma for whiteboarding because Branden had experience with other whiteboarding tools and that was one that he liked best, and nobody else had any different opinions about it. All decisions were made in just a democratic manner. We did not have any disagreements, so it was easy to achieve consensus.

### Code Design

Our approach to the code design was to first conduct a research phase where we read all materials relevant to the project to fully understand it and the problems involved that we are trying to solve. This included studying the CSV data and all of its fields to get a sense of the scale and type of data. Once this research was done, we conducted our team design meeting, using the Figma board. We quickly fleshed out the general classes that we wanted to use. We then discussed the hierarchy of data flow through the application. We thought this was largely sufficient initially to get us started, but later found out that it was not, as further discussed below.

## Define The Relationship (DTR)

- [DTR](https://docs.google.com/document/d/1Yv_6XLyElJfR1dS5mO1HPwkRwRliS-sgg_A5Fx4c57E/edit?usp=sharing)

## Challenges

### Lack of specification in design

The first major challenge was in the initial design planning and implementation because we had to figure out where the data should be parsed, in what class the data should be stored, and how the data should be passed through each class. We did not fully specify this in our initial design meeting before starting implementation, so this led to some further rework needed the next day.

### Overly complex initial design

Other design issues also appeared later on after a day or 2 of work on the statistic methods. There were 2 major problems: 1) a lack of clarity on how postseason and regular season data should be handled which should have been clarified before moving forward with implementing a design, and 2) passing data through multiple levels of objects.

### Unclean pull requests

This challenge has 2 parts: 1) a lack of attention to detail on the part of those creating the pull request, and 2) a weak approval process for approving and merging pull requests. It is really difficult to be able to accurately review and approve code on GitHub. So we ended up merging a couple of pull requests that had syntax errors, or did not pass tests, or the code did not run for some other reason. This then created delays as we all had to mob-program through these errors and bugs to resolve them before we could continue. This was an inefficient process that wasted some significant time as we had to mob-program through the issues for some hours.

### Merge conflicts

Merge conflicts also became fairly common with each new PR because once everyone has to make a new commit locally to resolve a merge conflict, that commit would not be in the commit history of others and trigger further merge conflicts. We are not entirely sure why the git merge strategies could not handle some of the changes being made. But if the merge conflicts became rampant, we were able to reset this behavior by simply deleting our local repo and re-cloning it from GitHub. This helped to resolve a lot of arbitrary merge conflicts.

## Lessons Learned

Frequent and open communication and collaboration was our primary tool for working through each challenge. In cases where not everyone was present when a challenge was resolved, that information was shared and reflected upon to ensure everyone was learning everything possible from the project.

### Improving the design planning

One of the biggest lessons learned form this project is to spend more time on the design phase of the project. In hindsight, we did not spend enough time on this design phase. We had diagrams and high-level conceptual ideas fleshed out. But we really should have spent more time getting the design so well specified that we had the pseudo code for each class' data attributes already written out, so we knew exactly how to structure the data and how to pass it around. To resolve this issue, further design planning work was done on our Figma whiteboard to fully map out the data to the class, and then the structure of the data within each class as its attributes.

So a major lesson here was to spend more time in the design process, and actually pseudo code out a complete specification of the data, especially for very data-centric projects such as this one.

### Simplifying the design

Some quick and early collaboration after the first implementation design created some early awareness of how awkward and needlessly complex it was to work with the data. It was requiring some nested iteration work to be done to work with data at the season or game level. This was resolved by simplifying the design by simply instantiating all of the objects within the `League` class which would store all the data. And then to only filter references to those objects as needed further down the data hierarchy. So instead of passing the filtered raw data, and instantiating the objects at every level in the hierarchy, we instantiated everything at the top-level, and only passed filtered references to those objects. This removed the need for nested iterations and simplified the implentation of all the methods for statistical analysis.

### Improving pull requests

It eventually occurred to us that trying to review and approve code on GitHub could not be done effectively since we are unable to run the code. We did not learn until late in the project that one solution to this was to start fetching the remote branches that had pull requests sent on them, and testing and running the code locally from there before actually approving and merging it. This should be a fundamental part of any code review and PR approval process. It is simply impossible to an effective review and approval without actually running the code locally.

Additionally, we had a team meeting about being more careful about what was being submitted as a pull request to prevent more issues upfront.

### Handling merge conflicts

We as a team got some extra practice navigating the merge conflicts within VS code. Also, if merge conflicts starting popping up even when there were no local changes made, we resolved this by deleteing the repository locally and re-cloning it from GitHub. This would clean out the local commit history with the added commits just for resolving arbitrary merge conflicts.

## Contributors / Authors

Branden Ge

- [GitHub](https://github.com/brandenge)
- [LinkedIn](https://www.linkedin.com/in/brandenge/)

Boston Lowrey

- [GitHub](https://github.com/BLowrey24)
- [LinkedIn](https://www.linkedin.com/in/boston-lowrey-43ba85260/)

Isaac Thill

- [GitHub](https://github.com/ithill22)
- [LinkedIn](https://www.linkedin.com/in/isaac-thill/)

Nicko Marquez

- [GitHub](https://github.com/NickolasAM)
- [LinkedIn](https://www.linkedin.com/in/nickolas-marquez-404752261/)
