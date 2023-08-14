variable "fe_domain" {
  type        = string
  description = "FE Domain"
}

variable "hosted_zone_public_id" {
  type        = string
  description = "Hosted Zone Public ID"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "cf_distribution_domain_name" {
  type        = string
  description = "CF Domain name"
}

variable "cf_distribution_hosted_zone_id" {
  type        = string
  description = "CF Hosted Zone id"
}
