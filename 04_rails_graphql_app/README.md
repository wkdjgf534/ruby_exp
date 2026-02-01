### Rails Graphql App

link to: [Unlocking GraphQL's Power with Rails: What No One's Told You Yet!](https://www.youtube.com/watch?v=nnHYfNRGFKQ)

visit URL: http://localhost:3000/graphiql

input someting

### Get user

```ruby
query {
  users {
    email
    name
    postCount
  }
}
```

### Post user

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

### Login user

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
