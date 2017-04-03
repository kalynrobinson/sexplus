# Sex+
Facilitating communication between couples, one survey at a time.

## Dependencies
Sex+ is optimized for Rails v5.0.2 and Ruby v2.3.3.

## Local Setup
* Clone the repository with `git clone git@github.com:kalynrobinson/sexplus.git`.
* Migrate and seed the database with `rake db:setup`.
* Run the server with `rails s` and navigate to http://localhost:3000/.

## Deployment
* Deploy to Heroku with `git push heroku master`.

## Tests
* Run all tests with `rails test`.

# Technical
* Uses [Devise](https://github.com/plataformatec/devise) for user authentication.
* Uses [Material Design Lite](https://getmdl.io/) for UI and mobile-first layout. (TODO: swap over to Material Components.)
