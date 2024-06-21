terraform {
  backend "s3" {
    bucket = "my-tf-state-buckt"
    key    = "my-terraform-state-project"
    region = "us-east-1"
    # shared_credentials_files = [ "~/.aws/credentials" ]
  }
}