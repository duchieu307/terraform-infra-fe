terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

module "s3_frontend" {
  source = "./modules/s3-cloudfront"

  project     = var.project
  env         = var.env
  fe_domain   = var.fe_domain
  cf_cert_arn = var.cf_cert_arn
  name        = "s3-fe"
}

module "route53" {
  source = "./modules/route53"

  project                        = var.project
  env                            = var.env
  hosted_zone_public_id          = var.hosted_zone_public_id
  fe_domain                      = var.fe_domain
  cf_distribution_domain_name    = module.s3_frontend.cf_distribution_domain_name
  cf_distribution_hosted_zone_id = module.s3_frontend.cf_distribution_hosted_zone_id

}

module "frontend-pipeline" {
  source = "./modules/pipeline-frontend"

  project    = var.project
  env        = var.env
  owner      = var.github.owner
  gitRepo    = var.github.name
  gitBranch  = var.github.branch
  OAuthToken = var.OAuthToken
}
