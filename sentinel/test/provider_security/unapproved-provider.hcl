mock "tfconfig/v2" {
  module {
    source = "mock-unapproved-provider.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}