variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "name" {
  type        = string
  description = "Module name"
}

variable "cf_cert_arn" {
  type        = string
  description = "CF Certificate"
}

variable "fe_domain" {
  type        = string
  description = "FE Domain"
}
