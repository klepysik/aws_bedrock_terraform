
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44.0" 
    }
  }
}

provider "aws" {
  region = var.region
}
resource "aws_iam_role" "example" {
  name               = "bedrock-terraform-access"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "bedrock.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "bedrock-terraform-access"
  description = "Allow access to S3 resources"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject"
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44.0" 
    }
  }
}

provider "aws" {
  region = var.region
}
resource "aws_iam_role" "example" {
  name               = "bedrock-terraform-access"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "bedrock.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "bedrock-terraform-access"
  description = "Allow read access to S3 resources"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource": [
          "arn:aws:s3:::bedrock-test-storage-folder/*",
          "arn:aws:s3:::bedrock-test-storage-folder/"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example_s3_access" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
        ],
        "Resource": [
          "arn:aws:s3:::bedrock-test-storage-folder/*",
          "arn:aws:s3:::bedrock-test-storage-folder/"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example_s3_access" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
