# README

## Running the project locally
Install dependencies

``` 
$ bundle install 
```

It is necessary to have postgres running locally.

Create db schema

```
$ rake db:create db:migrate
```

Run the seed file and seed the database from the csv file

```
$ rails db:seed
```

Start the project
```
$ rails s
```

## Running the project with Docker
Commands to start the project with Docker

```
$ docker-compose build
$ docker-compose up
```
