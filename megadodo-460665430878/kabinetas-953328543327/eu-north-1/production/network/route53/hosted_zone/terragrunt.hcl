include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/route53_hosted_zone?ref=v0.2.4"
}

inputs = {
  name        = "kabinetas.dontpanic.lt"
  environment = "production"
  project     = "kabinetas"
}
