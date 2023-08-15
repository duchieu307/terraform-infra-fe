variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "owner" {
  type        = string
  description = "Github repo owner"
}

variable "gitRepo" {
  type        = string
  description = "Github repo"
}

variable "gitBranch" {
  type        = string
  description = "Github branch"
}

variable "OAuthToken" {
  type        = string
  description = "Github OAuthToken"
}

variable "codebuild_role_arn" {
  type        = string
  description = "Github OAuthToken"
}

variable "codepipeline_role_arn" {
  type        = string
  description = "Github OAuthToken"
}

variable "codebuild_image" {
  type        = string
  description = "Codebuild Image"
}

variable "codebuild_compute_type" {
  type        = string
  description = "Codebuild Compute Type"
}

variable "s3_frontend_bucket_name" {
  type        = string
  description = "S3 Frontend Bucket Name"
}

