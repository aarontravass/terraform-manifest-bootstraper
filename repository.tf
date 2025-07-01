locals {
  should_use_template = var.repository_template != null
  org_name            = var.org != null && length(var.org) > 0 ? "${var.org}/" : ""
}

resource "github_repository" "example" {
  name = "${local.org_name}${var.repository_name}"

  description = var.description

  visibility         = var.repository_visibility
  archive_on_destroy = var.archive_on_destroy

  template {
    owner                = local.should_use_template ? var.repository_template.owner : null
    repository           = local.should_use_template ? var.repository_template.repository : null
    include_all_branches = false
  }
}
