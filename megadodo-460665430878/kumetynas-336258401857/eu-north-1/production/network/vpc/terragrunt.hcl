include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/vpc?ref=v0.2.3"
}

inputs = {
  name        = "kumetynas"
  environment = "production"
  project     = "kumetynas"
  cidr_block  = "10.42.0.0/22"
}
