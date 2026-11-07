mock "tfplan/v2" {
  module {
    source = "./mock-approved-region.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}