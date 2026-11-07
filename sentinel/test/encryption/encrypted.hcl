mock "tfplan/v2" {
  module {
    source = "./mock-encrypted.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}