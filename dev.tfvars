project = "frontend"
env     = "dev"
region  = "ap-southeast-1"


#CF Cert
cf_cert_arn = "arn:aws:acm:us-east-1:364402321456:certificate/eef46d9f-25cf-47d7-af2f-cacd44aad182"


#Domain
fe_domain = "hieuvunghichaws.com"

#DNS
hosted_zone_public_id = "Z0186683UMJPUFN55EMV"

#Github
github = {
  name   = "terraform-fe"
  branch = "main"
  owner  = "duchieu307"
}
OAuthToken = "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"

#Pipeline
codebuild_image        = "BUILD_GENERAL1_SMALL"
codebuild_compute_type = "aws/codebuild/standard:5.0"
