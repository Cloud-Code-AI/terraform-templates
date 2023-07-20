# TODO

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
# TODO: Update your region
  region = var.region
}

resource "aws_s3_bucket" "static_website_with_s3" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "static_website_with_s3" {
  bucket = aws_s3_bucket.static_website_with_s3.id

  index_document {
    suffix = var.index_file_path
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "static_website_with_s3" {
  bucket = aws_s3_bucket.static_website_with_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "static_website_with_s3" {
  bucket = aws_s3_bucket.static_website_with_s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "static_website_with_s3" {
  depends_on = [
    aws_s3_bucket_ownership_controls.static_website_with_s3,
    aws_s3_bucket_public_access_block.static_website_with_s3,
  ]

  bucket = aws_s3_bucket.static_website_with_s3.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_website_access" {
  bucket = aws_s3_bucket.static_website_with_s3.id
  policy = data.aws_iam_policy_document.allow_website_access.json
}

data "aws_iam_policy_document" "allow_website_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.static_website_with_s3.arn,
      "${aws_s3_bucket.static_website_with_s3.arn}/*",
    ]
  }
}