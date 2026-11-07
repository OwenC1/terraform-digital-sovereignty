mock "tfplan/v2" {
  module {
    source = "./mock-optional.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}