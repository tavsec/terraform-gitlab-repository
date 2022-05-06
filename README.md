# HiGroup GitLab repository Terraform
## How to setup
- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Update variables in `var.tfvars` (list of variables on Table 1)
- Run `terraform init`
- Run `terraform apply -var-file="var.tfvars"`
- If you want to delete all of the resources, run `terraform destroy -var-file="var.tfvars"`

## Variables

| Variable | Required | Default | Description |
| --------------- | --------------- | --------------- | --------------- 
| `gitlab_token` | ✅ | - | Access token for communication with Gitlab. https://gitlab.com/-/profile/personal_access_tokens |
| `project_name` | ✅ | - | Name of the project, including the project number |
| `project_description` | ❌ | - | Project description |
| `group_name` | ✅ | `higroup-admins` | GitLab group |
| `project_visibility` | ❌ | `private` | Repository visibility |
| `git_default_branch` | ❌ | `develop` | Repository default branch |
| `git_branches` | ❌ | `["staging", "pre-release", "production"]` | List of repository branches |
| `aws_access_key_id` | ✅ | - | AWS Access Key ID to be inserted for CICD |
| `aws_access_key_secret` | ✅ | - | AWS Access Secret Key to be inserted for CICD |