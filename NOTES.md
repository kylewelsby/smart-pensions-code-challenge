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