### Rails Graphql App

visit URL: http://localhost:3000/graphiql

input someting

get data

```ruby
query {
  users {
    email
    name
    postCount
  }
}
```

post user

```ruby
mutation {
  createUser(input: {
    name: "Rails Test",
    email: "rails.test@test.com"
  }) {
    user {
      id,
      email
    }
  }
}
```
