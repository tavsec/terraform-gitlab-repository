variable "gitlab_token" {
  description = "The OAuth2 Token, Project, Group, Personal Access Token or CI Job Token used to connect to GitLab"
  type        = string
}

variable "project_name" {
  description = "Name of the project (including the project number)"
}

variable "project_description" {
  type    = string
  default = ""
}

variable "group_name" {
  type    = string
  default = "tavsec"
}

variable "project_visibility" {
  type    = string
  default = "private"
}

variable "git_default_branch" {
  type    = string
  default = "develop"
}

variable "git_branches" {
  type        = list(string)
  description = "List of branches"
  default     = ["staging", "pre-release", "production"]
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key for CICD"
}

variable "aws_access_key_secret" {
  type        = string
  description = "AWS access secret for CICD"
}
