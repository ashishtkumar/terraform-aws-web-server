test {
  name = "plan-with-required-name-tags"
  rules = {
    main = true
  }

  mock {
    imports = {
      "tfplan/v2" = {
        # Point to your downloaded mock file
        data = file("../../run-vP1DWJH7K458iznk-sentinel-mocks/mock-tfplan-v2.sentinel")
      }
    }
  }
}