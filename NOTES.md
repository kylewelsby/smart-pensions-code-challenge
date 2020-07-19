2020-07-19 20:00:00

Started the project, getting the basic project folder structure setup as per other code challenges I have undertaken, like [FreeAgent](https://github.com/kylewelsby/FreeAgent.co.uk-code-challenge), and [RentalCars.com](https://github.com/kylewelsby/rentalcars.com-code-challenge).

2020-07-19 20:28:00

Now got a base structure of the basic structure set up, I can start implementing functionality.  I'll start by reading the `webserver.log` document. 

Breaking each line of the WebServer log into a page visit class feels about right to have a class instance for each record. 

2020-07-19 20:50:00

Now to construct a simple in-memory query to return a list of pages ordered by views descending. 

2020-07-19 21:05:00

Happy with the simple results of the page results

```
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

2020-07-19 21:50:00

Doing a load of refactors to cleanup any duplications and allow to the unique code flows. 
Also considering separating some concerns. 

2020-07-19 22:10:00

I feel I am at a completion point; this project suggested 2.5 hours from start to finish.  I'll do one final sweep on the document specifications and code before marking this challenge as complete. 

2020-07-19 22:30:00

Decided to quickly change the output to a simple table layout for prettier print output. 

2020-07-19 23:00:00

Final thoughts. 

I quickly put in GitHub actions to conduct Continuous Integration and switch from [RuboCop](https://rubocop.org/) to [StandardRB](https://github.com/testdouble/standard#readme).
Did not package this project as a rubygem as it's not intended to be published, its just to showcase my code approach.  See [ActionCable Bunny](https://github.com/kylewelsby/action-cable-bunny) for a full gem release
