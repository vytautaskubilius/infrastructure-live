include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/route53_dns_record?ref=v0.2.2"
}

dependency "hosted_zone" {
  config_path = "${get_terragrunt_dir()}/../hosted_zone"
}

inputs = {
  hosted_zone_id = dependency.hosted_zone.outputs.hosted_zone_id
  record_map = {
    "url9243.kumetynas.lt" = {
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "23026196.kumetynas.lt" = {
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "em7346.kumetynas.lt" = {
      type    = "CNAME"
      records = ["u23026196.wl197.sendgrid.net"]
    },
    "s1._domainkey.kumetynas.lt" = {
      type    = "CNAME"
      records = ["s1.domainkey.u23026196.wl197.sendgrid.net"]
    },
    "s2._domainkey.kumetynas.lt" = {
      type    = "CNAME"
      records = ["s2.domainkey.u23026196.wl197.sendgrid.net"]
    }
  }
}
