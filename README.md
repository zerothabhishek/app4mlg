
## Solution to [MLG](www.majorleaguegaming.com) coding problem for recruitment.

###The problem:

Create a Rails 3 application, complete with all unit and functional tests that:

·          Accepts personal information (first name (required), last name (required), address (required), phone number (not required), email (required)) from both a form and via a Restful API
·          Saves records to an instance of MySQL
·          Provides a way to search the contacts database by name (support for partial matches not needed)
·          Ensures the application performs validations where appropriate

Bonus:

·          On successful creation of a new account, inform a queue (e.g. Redis, Sparrow, etc.) that a new account was created
·          Write a listener for the queue that will update account record to indicate that it was "verified"
·          Demonstrate a set of integration test(s) to verify the system works appropriately

### Solution.

This rails application.
Deployed [here]("")

Queue used: **beanstalkd** 
Beanstalk client: the `stalker:start` rake task (uses Stalker gem)
Tests: `rake:test`