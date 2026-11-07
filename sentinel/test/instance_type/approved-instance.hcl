mock "tfplan/v2" {
  module {
    source = "./mock-approved-instance.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}