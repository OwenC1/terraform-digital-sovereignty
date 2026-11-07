mock "tfconfig/v2" {
  module {
    source = "mock-approved-provider.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}