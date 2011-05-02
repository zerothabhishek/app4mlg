
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

### The Code.
The most relevant code is in the following files -

_app/controllers/accounts_controller.rb_ : contains the Account controller along with the search action  

_app/models/account.rb_ : contains the Account model, which has the methods for informing the queue, and another one for marking an account as verified  

_lib/jobs.rb_ : defines the "account.verify" worker that picks up items from the queue and executes them in the background.

_lib/tasks/jobs.rake_ : the rake task that starts the worker that can perform the background job by picking up items from the queue.

_test/unit/account_test.rb_ : unit tests for the account model 

_test/functional/account_controller_test.rb_ : functional tests - tests the actions in the AccountsController.

_test/integration/account_creation_flow_test.rb_ : tests the steps in the flow for account creation - filling the form, creation of account record, and showing the account page

_test/integration/background_job_flow_test.rb: tests the flow of the rails application inserting a background job to the Queue.

