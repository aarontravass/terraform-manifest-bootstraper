variable "region" {
  type = string
}

variable "org" {
  type    = string
  default = null
}

variable "repository_name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "repository_visibility" {
  type = string
}

variable "repository_template" {
  description = "(Optional) Template repository to use. (Default: {})"
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "archive_on_destroy" {
  type        = string
  description = "(Optional) Set to `false` to not archive the repository instead of deleting on destroy."
  default     = true
}

variable "s3_tags" {
  type    = map(string)
  default = null
}

variable "s3_env" {
  type    = string
  default = null
}

variable "aws_account_alias" {
  type    = string
  default = ""
}
