
## Getting Started
Ruby version 2.5.0
Rails version 5.1.5

### Prerequisites
#### Postgres
Install Postgres at https://www.postgresql.org/

### Installing
Clone repository and cd into folder.  

This project uses Poltergeist (https://github.com/teampoltergeist/poltergeist), which requires PhantomJS.  Run ```brew install phantomjs```
or visit link for installation instructions.

Run ```bundle install``` to install dependencies:

#### Database setup
Make sure Postgres is running!

1. Create databases
```
rails db: create
```
2. Run migrations
```
rails db: migrate
```

#### Start server
Server runs on localhost:3000 with
```
rails server
```

## Testing

Testing suite is run with
```
rake
```
