include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/route53_hosted_zone?ref=v0.2.3"
}

inputs = {
  name        = "akmuotis.lt"
  environment = "production"
  project     = "akmuotis"
}
