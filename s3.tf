locals {
  bucket_org_name = var.org != null && length(var.org) > 0 ? "${var.org}" : ""
  s3_bucket_name  = var.bucket_name != null && length(var.bucket_name) ? var.bucket_name : "${local.bucket_org_name}-${var.repository_name}-${var.aws_account_alias}-${var.region}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.s3_bucket_name
  tags = merge(var.s3_tags, {
    env        = var.s3_env
    name       = local.s3_bucket_name
    repository = "${local.bucket_org_name}/${var.repository_name}"
    region     = var.region
    org        = var.org
  })
}
