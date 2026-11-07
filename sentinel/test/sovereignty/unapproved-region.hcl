mock "tfconfig/v2" {
  module {
    source = "./mock-unapproved-region.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}