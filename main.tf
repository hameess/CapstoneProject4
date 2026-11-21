terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "s3_reader" {
  name = var.iam_username

  tags = {
    Purpose = "S3ReadAutomation"
  }
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.iam_username}-s3-read-policy"
  description = "S3 read policy stored as a Terraform variable"
  policy      = var.s3_read_policy_json
}

resource "aws_iam_user_policy_attachment" "s3_read_attach" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
