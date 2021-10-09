remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "megadodo-eu-north-1-production-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "megadodo-eu-north-1-production-tf-state"
    region         = "eu-north-1"
    encrypt        = true
    s3_bucket_tags = {
      "project"     = "megadodo"
      "environment" = "production"
      "managed-by"  = "terraform"
      "github"      = "https://github.com/vytautaskubilius/infrastructure-live"
    }
    dynamodb_table_tags = {
      "project"     = "megadodo"
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
      environment = "production"
      project = "megadodo"
    }
  }
}
EOF
}
