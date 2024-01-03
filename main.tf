terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "core-tf-state-pk-test"
    region         = "eu-west-1"
    key            = "terraform.tfstate"
    dynamodb_table = "core-tf-lock-dynamo-pk-test"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "pk-test"
  }
}
