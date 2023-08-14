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