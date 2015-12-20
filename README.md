# E-vader

## Installation

`bundle install`

## Run

Execute migrations && seeds: `rake db:setup`

Run the server: `bundle exec rails s`

**NOTE:** If you use vagrant, should use `bundle exec rails s -b 0.0.0.0`

## Tests

Migrate to test database:

`rake db:migrate RAILS_ENV=test`

Executes the tests:

`rake test --verbose`
