output "website_endpoint" {
  value = aws_s3_bucket.static_website_with_s3.website_domain
}