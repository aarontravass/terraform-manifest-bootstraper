locals {
  bucket_org_name = var.org != null && length(var.org) > 0 ? "${var.org}" : ""
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${local.bucket_org_name}-${var.repository_name}-${var.aws_account_alias}-${var.region}"
  tags = merge(var.s3_tags, {
    env        = var.s3_env
    name       = "${local.bucket_org_name}-${var.repository_name}-${var.aws_account_alias}-${var.region}"
    repository = "${local.bucket_org_name}/${var.repository_name}"
    region     = var.region
    org        = var.org
  })
}
