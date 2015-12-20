# E-vader

## Installation

`bundle install`

## Run

Execute migrations && seeds: `bundle exec rake db:migrate && bundle exec rake db:setup`

Run the server: `bundle exec rails s`

**NOTE:** If you uses vagrant, should use `bundle exec rails s -b 0.0.0.0`

## Tests

Migrate to test database:

`bundle exec rake db:migrate RAILS_ENV=test`

Executes the tests:

`bundle exec rake test --verbose`
