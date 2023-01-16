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
    "em6643.dontpanic.lt" = {
      name = "em6643.dontpanic.lt"
      type    = "CNAME"
      records = ["u23026196.wl197.sendgrid.net"]
    },
    "s1._domainkey.dontpanic.lt" = {
      name = "s1._domainkey.dontpanic.lt"
      type    = "CNAME"
      records = ["s1.domainkey.u23026196.wl197.sendgrid.net"]
    },
    "s2._domainkey.dontpanic.lt" = {
      name = "s2._domainkey.dontpanic.lt"
      type    = "CNAME"
      records = ["s2.domainkey.u23026196.wl197.sendgrid.net"]
    },
    "url3484.dontpanic.lt" = {
      name = "url3484.dontpanic.lt"
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "23026196.dontpanic.lt" = {
      name = "23026196.dontpanic.lt"
      type    = "CNAME"
      records = ["sendgrid.net"]
    },
    "kabinetas.dontpanic.lt" = {
      name = "kabinetas.dontpanic.lt"
      type = "NS"
      records = [
        "ns-121.awsdns-15.com",
        "ns-1213.awsdns-23.org",
        "ns-1650.awsdns-14.co.uk",
        "ns-871.awsdns-44.net"
      ]
    },
    "dontpanic.lt-mx" = {
      name = "dontpanic.lt"
      type = "MX"
      records = [
        "10 mx01.mail.icloud.com.",
        "20 mx02.mail.icloud.com."
      ]
    },
    "dontpanic.lt-txt" = {
      name = "dontpanic.lt"
      type = "TXT"
      records = [
        "apple-domain=y1180hWaHzpFCI5A",
        "v=spf1 redirect=icloud.com"
      ]
    },
    "sig1._domainkey.dontpanic.lt" = {
      name = "sig1._domainkey.dontpanic.lt"
      type = "CNAME"
      records = [
        "sig1.dkim.dontpanic.lt.at.icloudmailadmin.com."
      ]
    }
  }
}
