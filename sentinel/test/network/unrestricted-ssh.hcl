mock "tfplan/v2" {
  module {
    source = "./mock-unrestricted-ssh.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}