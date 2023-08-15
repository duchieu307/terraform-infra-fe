
output "cf_distribution_domain_name" {
  value = aws_cloudfront_distribution.cf_distribution.domain_name
}

output "cf_distribution_hosted_zone_id" {
  value = aws_cloudfront_distribution.cf_distribution.hosted_zone_id
}


output "s3_frontend_bucket_name" {
  value = aws_s3_bucket.s3.bucket
}

output "s3_frontend_bucket_arn" {
  value = aws_s3_bucket.s3.arn
}
