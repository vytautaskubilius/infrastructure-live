remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "kumetynas-eu-north-1-production-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "kumetynas-eu-north-1-production-tf-state"
    region         = "eu-north-1"
    encrypt        = true
    s3_bucket_tags = {
      "project"     = "kumetynas"
      "environment" = "production"
      "managed-by"  = "terraform"
      "github"      = "https://github.com/vytautaskubilius/infrastructure-live"
    }
    dynamodb_table_tags = {
      "project"     = "kumetynas"
      "environment" = "production"
      "managed-by"  = "terraform"
      "github"      = "https://github.com/vytautaskubilius/infrastructure-live"
    }
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      Name = "kumetynas"
      environment = "production"
      project = "kumetynas"
    }
  }
}
EOF
}
