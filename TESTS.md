# TESTS

## Run Tests

`bin/rspec`

## Run Tests Automatically (Guard)

My prefered way to work:

`bin/guard -P rspec` - will run in the background and automatically run tests when they are saved. Check `Guardfile` to setup rules for running tests automatically.

## Code Coverage (Simplecov)

Running all tests will create a report - `open confab/coverage/index.html`
