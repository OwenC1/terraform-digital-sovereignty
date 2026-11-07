mock "tfplan/v2" {
  module {
    source = "./mock-required.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}