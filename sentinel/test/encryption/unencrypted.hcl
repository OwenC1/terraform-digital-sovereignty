mock "tfplan/v2" {
  module {
    source = "./mock-unencrypted.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}