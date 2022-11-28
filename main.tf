terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.14.0"
    }
  }
}

provider "gitlab" {
  token = var.gitlab_token
}

data "gitlab_group" "group" {
  full_path = var.group_name
}

resource "gitlab_project" "project" {
  name        = var.project_name
  description = var.project_description

  visibility_level = var.project_visibility

  default_branch = var.git_default_branch

  namespace_id = data.gitlab_group.group.group_id
}

resource "gitlab_branch" "branches" {
  for_each = toset(var.git_branches)
  ref      = var.git_default_branch
  project  = gitlab_project.project.id
  name     = each.key
}

resource "gitlab_branch_protection" "protected_branches" {
  for_each               = toset(var.git_branches)
  project                = gitlab_project.project.id
  branch                 = each.key
  push_access_level      = "maintainer"
  merge_access_level     = "maintainer"
  unprotect_access_level = "maintainer"
}

resource "gitlab_project_variable" "aws_access_key_id" {
  project   = gitlab_project.project.id
  key       = "AWS_ACCESS_KEY_ID"
  value     = var.aws_access_key_id
  protected = false
}

resource "gitlab_project_variable" "aws_access_key_secret" {
  project   = gitlab_project.project.id
  key       = "AWS_SECRET_ACCESS_KEY"
  value     = var.aws_access_key_secret
  protected = false
}
