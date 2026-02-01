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
    name: "PW Test",
    email: "pw.test@test.com"
    password: "wonderfullpassword"
  }) {
    user {
      id,
      email
    }
  }
}
```

login user

```ruby
mutation {
  login(input: {
    email: "pw.test@test.com"
    password: "wonderfullpassword"
  }) {
    token
  }
}
```
