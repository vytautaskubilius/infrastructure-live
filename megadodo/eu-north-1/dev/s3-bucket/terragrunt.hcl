include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-private-modules.git//modules/s3-bucket-private?ref=v0.0.1"
}