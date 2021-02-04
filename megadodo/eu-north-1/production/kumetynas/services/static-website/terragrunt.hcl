include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/static-website?ref=v0.1.0"
}

inputs = {
  hosted_zone_id = "Z00001973I24OH2B5F5CF"
  hostname       = "kumetynas.lt"
  tags = {
    project = "kumetynas"
  }
}
