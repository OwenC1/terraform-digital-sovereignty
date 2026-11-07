mock "tfconfig/v2" {
  module {
    source = "mock-unapproved-module.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}