

# variable "availability_zone" {
#   type        = string
#   description = "Project Avaibility Zone"
# }

variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "cf_cert_arn" {
  type        = string
  description = "CF Certificate"
}

variable "fe_domain" {
  type        = string
  description = "FE Domain"
}

variable "hosted_zone_public_id" {
  type        = string
  description = "Hosted Zone Public ID"
}

variable "github" {
  type = object({
    name   = string
    branch = string
    owner  = string
  })
}

variable "OAuthToken" {
  type        = string
  description = "Github OAuth Token"
}

variable "codebuild_image" {
  type        = string
  description = "Codebuild Image"
}

variable "codebuild_compute_type" {
  type        = string
  description = "Codebuild Compute Type"
}

