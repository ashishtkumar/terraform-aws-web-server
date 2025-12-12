mock "input" {
  data = {
    instances = [
      { tags = { Environment = "prod" } } # Missing Name
    ]
  }
}

test {
  rules = { main = false }
}