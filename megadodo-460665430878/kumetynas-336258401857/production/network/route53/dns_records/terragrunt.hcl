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
    "akmuotis.lt-mx" = {
      name = "akmuotis.lt"
      type = "MX"
      records = [
        "10 mx01.mail.icloud.com.",
        "20 mx02.mail.icloud.com."
      ]
    },
    "akmuotis.lt-txt" = {
      name = "akmuotis.lt"
      type = "TXT"
      records = [
        "apple-domain=HgnzgAJt1B5br3Yk",
        "v=spf1 include:icloud.com ~all"
      ]
    },
    "sig1._domainkey.akmuotis.lt" = {
      name = "sig1._domainkey.akmuotis.lt"
      type = "CNAME"
      records = [
        "sig1.dkim.akmuotis.lt.at.icloudmailadmin.com."
      ]
    }
  }
}
