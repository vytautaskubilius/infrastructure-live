include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:vytautaskubilius/infrastructure-modules.git//modules/route53_dns_record?ref=v0.3.0"
}

dependency "hosted_zone" {
  config_path = "${get_terragrunt_dir()}/../hosted_zone"
}

inputs = {
  hosted_zone_id = dependency.hosted_zone.outputs.hosted_zone_id
  record_map = {
    "urla.lt-mx" = {
      name = "urla.lt"
      type = "MX"
      records = [
        "10 mx01.mail.icloud.com.",
        "20 mx02.mail.icloud.com."
      ]
    },
    "urla.lt-txt" = {
      name = "urla.lt"
      type = "TXT"
      records = [
        "apple-domain=LNUQ3uUhXFWz45XU",
        "v=spf1 include:icloud.com ~all"
      ]
    },
    "sig1._domainkey.urla.lt" = {
      name = "sig1._domainkey.urla.lt"
      type = "CNAME"
      records = [
        "sig1.dkim.urla.lt.at.icloudmailadmin.com."
      ]
    }
  }
}
