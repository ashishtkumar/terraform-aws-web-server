mock "input" {
  data = {
    instances = [
      { tags = { Name = "web-server", Environment = "prod" } },
      { tags = { Name = "api", Environment = "prod" } }
    ]
  }
}

test {
  rules = { main = true }
}