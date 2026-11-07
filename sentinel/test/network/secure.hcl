mock "tfplan/v2" {
  module {
    source = "./mock-secure.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}