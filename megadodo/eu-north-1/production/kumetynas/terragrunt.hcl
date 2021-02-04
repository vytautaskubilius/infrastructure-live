remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "kumetynas-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "kumetynas-tf-state"
    region         = "eu-north-1"
    encrypt        = true
    s3_bucket_tags = {
      "project"    = "kumetynas"
      "managed-by" = "terraform"
      "github"     = "https://github.com/vytautaskubilius/infrastructure-live"
    }
    dynamodb_table_tags = {
      "project"    = "kumetynas"
      "managed-by" = "terraform"
      "github"     = "https://github.com/vytautaskubilius/infrastructure-live"
    }
  }
}
