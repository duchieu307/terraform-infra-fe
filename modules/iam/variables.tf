variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}



variable "s3_artifact_bucket_arn" {
  type        = string
  description = "S3 Artifact Bucket Arn"
}


variable "s3_frontend_bucket_arn" {
  type        = string
  description = "S3 Fronte d Bucket Arn"
}

