###Who Wants To Be a Mollionaire?
Description

This is an implementation of a famous game

Language: Russian

The game is for one or more players. You must answer the questions and choose a correct answer out of 4 given by the programm. If answered correctly the player gets a money prize with a total of 1 000 000 dollars in case of victory. The game has special Savers form the player.

Savers

- Ask the Audience
- 50:50
- Phone a Friend

The player can stop the game and fix the prize already collected.

Admins of the game can load new questions from files ( see data folder )

```
Ruby 2.5.8 Rails 4.2.11.1
```

DataBase
development: SQLite3 production: PostgreSQL

Getting Started
Downloaad or clone bbq repository
Use bundle

```
$ bundle install
```

Create Database

```
$ bundle exec rails db:create
```

Run database migrations

```
$ bundle exec rails db:migrate
```

Link on Heroku  https://play-khsm.herokuapp.com
