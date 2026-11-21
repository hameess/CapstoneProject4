variable "aws_region" {
  description = "AWS region for provider configuration"
  type        = string
  default     = "ap-south-1"
}

variable "iam_username" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "tf-s3-reader-user"
}

variable "s3_read_policy_json" {
  description = "IAM policy JSON granting read-only access to S3"
  type        = string
  default     = <<-POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "S3ReadOnlyAccess",
          "Effect": "Allow",
          "Action": [
            "s3:Get*",
            "s3:List*"
          ],
          "Resource": "*"
        }
      ]
    }
  POLICY
}
