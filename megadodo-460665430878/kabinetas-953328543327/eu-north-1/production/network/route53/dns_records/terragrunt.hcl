include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/route53_dns_record?ref=v0.2.4"
}

dependency "hosted_zone" {
  config_path = "${get_terragrunt_dir()}/../hosted_zone"
}

inputs = {
  hosted_zone_id = dependency.hosted_zone.outputs.hosted_zone_id
  record_map = {
    "url9985.kabinetas.dontpanic.lt" = {
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "23026196.kabinetas.dontpanic.lt" = {
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "em5023.kabinetas.dontpanic.lt" = {
      type    = "CNAME"
      records = ["u23026196.wl197.sendgrid.net"]
    },
    "s1._domainkey.kabinetas.dontpanic.lt" = {
      type    = "CNAME"
      records = ["s1.domainkey.u23026196.wl197.sendgrid.net"]
    },
    "s2._domainkey.kabinetas.dontpanic.lt" = {
      type    = "CNAME"
      records = ["s2.domainkey.u23026196.wl197.sendgrid.net"]
    }
  }
}
