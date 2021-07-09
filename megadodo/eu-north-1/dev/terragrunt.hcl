remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "tfstate-480bd8f8d2114c18aa921ca70a1a3cb6"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "tfstate-480bd8f8d2114c18aa921ca70a1a3cb6"
    region         = "eu-north-1"
    encrypt        = true
    s3_bucket_tags = {
      "managed-by" = "terraform"
      "github"     = "https://github.com/vytautaskubilius/infrastructure-live"
    }
    dynamodb_table_tags = {
      "managed-by" = "terraform"
      "github"     = "https://github.com/vytautaskubilius/infrastructure-live"
    }
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-north-1"
  allowed_account_ids = ["460665430878"]
}
EOF
}