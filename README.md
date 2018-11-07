# README

Simple anotations app which saves weather and geoposition at the time.

## Ruby version
  ruby 2.5.0p0
  rails 5.1.6'

## API's
  [OpenWeatherMap](https://openweathermap.org/current)
  [ipstack](https://ipstack.com/)

## Configuration
  create a local_env.yml file with your WEATHER_API_KEY and IPSTACK_KEY.
  
## Database creation
  Restore the database with the db.dump file or run rails db:create

## How to run the test suite
  RSpec, Capybara, FactoryBot for unit testing.
  Just run rspec

## Deployment instructions
  Setup environment variables on Heroku
  Restore database through the db.dump file
  
## TO-DO
  – Add remove post button
  – Add follow other user option
  – Improve UX