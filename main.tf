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
    key            = "${var.env}/terraform.tfstate"
    dynamodb_table = "core-tf-lock-dynamo-pk-test-${var.env}"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name}-${var.env}"

  tags = {
    Name        = var.bucket_name
    Environment = var.env
  }
}

resource "aws_s3_bucket" "example_two" {
  bucket = "${var.snd_bucket_name}-${var.env}"

  tags = {
    Name        = var.snd_bucket_name
    Environment = var.env
  }
}

resource "aws_s3_bucket" "third_bucket" {
  bucket = "${var.third_bucket_name}-${var.env}"

  tags = {
    Name        = var.third_bucket_name
    Environment = var.env
  }
}
