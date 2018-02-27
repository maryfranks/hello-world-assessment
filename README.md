
## Getting Started
Ruby version 2.5.0
Rails version 5.1.5

### Prerequisites
#### Postgres
Install Postgres at https://www.postgresql.org/

### Installing
Clone repository and cd into folder.  Run the following commands to install dependencies:

```
bundle install
```

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

## Testing

Testing suite is run with
```
rake
```
