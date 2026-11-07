mock "tfconfig/v2" {
  module {
    source = "mock-approved-module.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}