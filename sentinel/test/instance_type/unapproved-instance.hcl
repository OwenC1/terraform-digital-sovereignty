mock "tfplan/v2" {
  module {
    source = "./mock-unapproved-instance.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}