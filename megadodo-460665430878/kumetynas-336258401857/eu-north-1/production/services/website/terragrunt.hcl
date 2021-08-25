include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/wordpress-instance?ref=v0.2.0"
}

dependency "vpc" {
  config_path = "${get_terragrunt_dir()}/../../network/vpc"
}

dependency "hosted_zone" {
  config_path = "${get_terragrunt_dir()}/../../network/route53/hosted_zone"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  subnet_id = dependency.vpc.outputs.public_subnet_id
  hosted_zone_id = dependency.hosted_zone.outputs.hosted_zone_id
  key_pair_name = "kumetynas-production"
  domain = "kumetynas.lt"
}
